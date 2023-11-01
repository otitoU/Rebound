//
//  StudentHomePage.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/28/23.
//

import SwiftUI
import StreamVideoSwiftUI

struct StudentHomePage: View {
    
    @State private var showCall: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var callViewModel: CallViewModel
    private let callId: String = "kYuMQUxr6hbg"
    var body: some View {
        
        
        
        TabView{
            
            VStack{
                ImageTitle()
                Spacer()
                
                
                Button{
                    viewModel.callStarted = true
                    Task {
                        guard callViewModel.call == nil else { return }
                        callViewModel.joinCall(callType: .default, callId: callId)
                    }
                }label: {
                    Image("OpenIcon")
                }
                
                
                
                
                
                
                Spacer()
                
                
            }
            .tabItem{
                

                Image(systemName: "house")
                    Text("Home")
                
                
                
            }
            

            StudentXMentorMessageScreen()
            .tabItem{
               
                    
                    
                    Image(systemName: "person.bubble.fill")
                    Text("Std Msgs")
                
                
                
            }
            
            
            StudentResourcesScreen()
            .tabItem{
                
                Image(systemName: "book.and.wrench.fill")
                    Text("Resources")
                
                
                
            }
            
            StudentHomeworkScreen()
            .tabItem{
             
                Image(systemName: "book.fill")
                    Text("HomeWrk")
                
                
                
            }
            
           
                
                
            
            
            
            
        }
        .accentColor(Color("brandPrimary"))
        
        
    }
}

struct StudentHomePage_Previews: PreviewProvider {
    static var previews: some View {
        StudentHomePage(callViewModel: .init())
    }
}
