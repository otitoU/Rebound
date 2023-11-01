//
//  AuthViewModel.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/22/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage
//import FirebaseDatabase

@MainActor
class AuthViewModel : ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: Userr?
    @Published var isUploading = false
    @Published var uploadProgress: Double = 0.0
    @Published var uploadError: Error?
    @Published var fileModels: [FileModel] = []
    @Published var metadata: [FileMetadata] = []
    @Published var callStarted = false
    private var db = Firestore.firestore()
    
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String, role: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Debug: failed to sign in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String, role: String, userName: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user =  Userr(id: result.user.uid, userName: userName, fullName: fullName, email: email, role: role)
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            await fetchUser()
        }catch{
            print("Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch{
            print("failed to signout with error")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return }
        self.currentUser =  try? await snapshot.data(as: Userr.self)
        
        print("Debug: current user is \(self.currentUser)")
    }
    
    func getUser() async{
        await fetchUser()
    }
    
    
    func handleSendMessage(text: String) {
        print(text)
        //           fileModels.removeAll()
    }
    
    func uploadFiles(fileModels: [FileModel]) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("files_metadata")
        
        Firestore.enableLogging(true)
//        print(fileModels)
        for fileModel in fileModels {
            print(fileModel.url)
            guard let data = try? Data(contentsOf: fileModel.url) else {
                // Handle error if unable to read data from the file URL
                print("cant read abegggggggggggggg")
                continue
            }
            print("data/////////////////////////")
            print(data)
            
            let fileRef = storageRef.child("uploads/\(fileModel.url.lastPathComponent)")
            
            uploadProgress = 0.0
            uploadError = nil
            
            
            let file: [String: Any] = [
                "url": fileModel.url.absoluteString,
                "filename": fileModel.filename
            ]
//            print(file)
            
//            print(data)
            collectionRef.addDocument(data: file) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document added successfully!")
                }
            }
            
            let uploadTask = fileRef.putData(data, metadata: nil) { metadata, error in
                if let error = error {
                    print("Error uploading file \(fileModel.filename): \(error.localizedDescription)")
                    self.uploadError = error
                } else {
                    print("File \(fileModel.filename) uploaded successfully!")
                }
            }
            
            uploadTask.observe(.progress) { snapshot in
                if let progress = snapshot.progress {
                    self.uploadProgress = Double(progress.completedUnitCount) / Double(progress.totalUnitCount)
                }
            }
            
            
            fetchFiles()
        }
        
        
    }
    
    
    func fetchFiles()  {
        let storageRef = storage.reference()
        let folderRef = storageRef.child("uploads")

        folderRef.listAll { result, error in
            if let error = error {
                print("Error listing files: \(error.localizedDescription)")
            } else {
                for item in result.items {
                    print("File: \(item.name)")
                }
            }
        }
        
        db.collection("files_metadata").getDocuments { snapshot, error in
            if error == nil{
                // no errors
                if let snapshot = snapshot{
                    //get all document and create filemeta data
                    self.metadata =  snapshot.documents.map{d in
                        return FileMetadata(id: d.documentID, url: d["downloadurl"] as! URL, filename: d["filename"] as! String)
                    }
                }
            }else{
                //handle error
            }
        }
        
        
    }
    
    func getUserId() -> String? {
        return currentUser?.id
    }
    
    
}
