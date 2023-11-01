//
//  SchoolFileUploadScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct SchoolFileUploadScreen: View {
    @State var fileName: String?
    @State var openfile = false
    @State var URL: URL?
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var fileModels: [FileModel] = []
    
    @State private var fileModelsForpreview: [FileModel] = []
    @State private var showAlert = false
    @State private var isShowingPopup = false
    
    
    var body: some View {
        
        ZStack {
                  // Your main content here...
            VStack
            {
                ImageTopBar()
                    .padding(.bottom, 32)
                
                
                                Text(viewModel.currentUser?.fullName ?? "Gregory Henderson")
                    .font(
                        Font.custom("SF Pro", size: 22)
                            .weight(.medium)
                    )
                    .kerning(0.29139)
                    .foregroundColor(.black)
                    .padding(.leading, -1)
                    .padding(.bottom, 19)
                
                
                Text("Upload Assignment")
                    .font(
                        Font.custom("SF Pro", size: 22)
                            .weight(.medium)
                    )
                    .kerning(0.29139)
                    .foregroundColor(.black)
                    .padding()
                
                
                Button{
                    openfile.toggle()
                    
                }label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 358, height: 202)
                            .background(Color(red: 0.89, green: 1, blue: 0.91))
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.09, green: 0.35, blue: 0.04), style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                            )
                        
                        
                        VStack{
                            Image(systemName: "icloud.and.arrow.up")
                                .font(.largeTitle)
                            Text("Tap to upload")
                            Text("Supported formates: JPEG, PNG,  PDF, Word").padding()
                            
                        }
                        
                    }.foregroundColor(.black)
                }
                .fileImporter(isPresented: $openfile, allowedContentTypes: [.pdf, .jpeg, .png, .html ,.url ,.text, .zip ]){(res) in
                    
                    do {
                        let fileUrl = try res.get()
                        print(res)
                        
                        let fileManager = FileManager.default

                        if fileManager.fileExists(atPath: fileUrl.absoluteString) {
                            // The file exists; you can access it here
                            print("Yes it exists")
                        } else {
                            // The file does not exist at the specified URL
                            print("no it doesnt  it exists")
                        }

                        
                        
                        
                        if !fileModels.contains(where: { $0.url == fileUrl }) {
                            self.fileName = fileUrl.lastPathComponent
                            let newFileModel = FileModel(url: fileUrl, filename: fileName ?? "")
                            fileModels.append(newFileModel)
//                            print(fileModels)
                        } else {
                            // Handle the case where the file with the same URL already exists
                            showAlert = true
                        }
                        
                   
                        
                       
                        
                        
                        //                    viewModel.uploadFile(fileURL: fileUrl)
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
                if(fileModels.count == 0){
                    Text("No files to upload") .font(
                        Font.custom("Mulish", size: 14)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .padding(10)
                    
                    
                   
                    
                }else{
                    VStack(alignment: .leading){
                        
                        Text("Uploaded")
                            .font(
                                Font.custom("Mulish", size: 14)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                            .padding(10)
                        
                        ScrollView{
                            
                            
                            
                            VStack(spacing: 10){
                            
                                ForEach(fileModels, id: \.url) { fileModel in
                                    UnitAssignmentList(fileObj: fileModel, fileModels: $fileModels)
                                    //show if there something in my filemodels
                                }
                                
                                
                            }
                        }
                        
                        Button{
                            viewModel.uploadFiles(fileModels: fileModels)
                            isShowingPopup = true
                            fileModels = []
                                 
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                isShowingPopup = false
                            }
                                
                            
                        }label: {
                            Text("Upload Files")
                            .font(
                            Font.custom("Mulish", size: 16)
                            .weight(.bold)
                            )
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 9)
                            .frame(width: 281, height: 45, alignment: .center)
                            .background(Color(.brandPrimary))
                            .cornerRadius(4)
                           
                        }
                        
                        
                      
                    }
                }
                
                
                //a collection holding  a model that has the url and filename
                
                //on insert append to my VStack display and append to my collection
                
                
                
                Spacer()
                Spacer()
                Spacer()
            } .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Duplicate File"),
                    message: Text("You can't upload duplicate files."),
                    dismissButton: .default(Text("OK"))
                )
            }
                  
                  if isShowingPopup {
                      // Popup view
                      Color.black.opacity(0.5)
                          .edgesIgnoringSafeArea(.all)
                          .onTapGesture {
                              // Dismiss the popup when tapped
                              isShowingPopup = false
                          }
                      
                      VStack {
                          Text("Files Uploaded!")
                          .font(
                          Font.custom("SF Pro Text", size: 28)
                          .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(.black)
                          .padding(.top, 20)
                          // Add any content you want in the popup here...
                          
                          Image("popupimage")
                      }
                      .frame(width: 335, height: 358)
                      .background(.white)
                      .cornerRadius(30)
                      .overlay(
                      RoundedRectangle(cornerRadius: 30)
                      .inset(by: 0.5)
                      .stroke(Color(red: 0.09, green: 0.35, blue: 0.04), lineWidth: 1)
                      )
                  }
              }
             
      
    }
}

#Preview {
    SchoolFileUploadScreen()
}
