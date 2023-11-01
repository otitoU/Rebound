//
//  MessagesView.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/9/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseDatabase
//import FirebaseDatabase


struct ChatMessage{
    let text:String
    let userId: String
}


struct MessagesView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var messageText : String = ""
    @State var message = [ChatMessage]()
    @State var userId = ""
    
    
    init(){
           if UserDefaults.standard.string(forKey: "userId") == nil {
               UserDefaults.standard.set(userId, forKey: "userId")
           }
       }
    
    var body: some View {
        
        return
        VStack{
            Text("Kendra Shepard")
                .font(Font.custom("SF Pro", size: 17))
                .fontWeight(.bold)
                .foregroundColor(Color(.brandPrimary))
                .frame(width: 500)
                .padding()
                .background(Color("brandSecondary"))
            
            
            
            
            ScrollView{
               
                ForEach(message, id: \.text){message in
                    HStack{
                        
                        if message.userId == self.userId{
                            
                            
                            Spacer()
                            Spacer()
                            Text(message.text)
                                .foregroundColor(.black)
                                .padding(.horizontal, 3.0)
                                .padding(.vertical, 10.0)
                                .background(Color("brandSecondary"))
                                .cornerRadius(7.0)
                                .multilineTextAlignment(.leading)
                            
                        }
                        else{
                            Text(message.text)
                                .foregroundColor(.black)
                                .padding(.horizontal, 3.0)
                                .padding(.vertical, 10.0)
                                .background(Color("brandSecondary").opacity(0.5))
                                .cornerRadius(7.0)
                                .multilineTextAlignment(.trailing)
                            
                            Spacer()
                            Spacer()
                        }
                    }
                    .padding(.top, 8)
                    
                    
                    
                }
                
                
                
            }
            .padding(.horizontal, 3)
            .frame(width: 370)
            
            
            
            VStack{
                
                HStack{
                    
                    TextField("Description", text: $messageText)
                    Button{
                        sendMessage()
                        //                            viewModel.handleSendMessage(text: chatText)
                    }label: {
                        Text("Send")
                    }
                }
                .frame(width: 350, height: 50)
                
            }
        }
        .onAppear{
            fetchUserId()
                        loadMessages()
        }
        
        
    }
    
    
    func sendMessage(){
        
        guard !messageText.isEmpty else {return}
        let dbRef = Database.database().reference()
        let messageRef = dbRef.child("messages").childByAutoId()
        let messageData = ["text": messageText, "userId" : userId,]
        messageRef.setValue(messageData)
        messageText = ""
    }
    func loadMessages(){
        
        let dbRef = Database.database().reference()
        dbRef.child("messages").observe(.childAdded) { snapshot in
            if let data = snapshot.value as? [String: Any],
               let text = data["text"] as? String,
               let userId = data["userId"] as? String {
                self.message.append(ChatMessage(text: text, userId: userId))
                let key = snapshot.key
            }
        }
        
    }
    
    
    func fetchUserId() {
           if let userId = viewModel.getUserId() {
               self.userId = userId
           }
        print(userId)
       }
}

#Preview {
    MessagesView()
}
