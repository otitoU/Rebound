//
//  TutorHomePage.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI
import StreamVideoSwiftUI

struct TutorHomePage: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var callViewModel: CallViewModel
    private let callId: String = "kYuMQUxr6hbg" // The CallId can be found in the Credentials section
    
    //    @State private var showCall: Bool = false
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
            
            
            VStack {
                ImageTopBar()
                    .padding(.bottom, 32)
                    .padding(.leading, -20)
                
                Text(viewModel.currentUser?.fullName ?? "Gregory Henderson")
                    .font(
                        Font.custom("SF Pro", size: 22)
                            .weight(.medium)
                    )
                    .kerning(0.29139)
                    .foregroundColor(.black)
                    .padding(.leading, -178)
                    .padding(.bottom, 19)
                
                Text("School Events")
                    .font(
                        Font.custom("SF Pro", size: 20)
                            .weight(.medium)
                    )
                    .kerning(0.29139)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                EventCardList()
                    .padding(.bottom, 30)
                
                Text("Messages")
                    .font(
                        Font.custom("SF Pro", size: 20)
                            .weight(.medium)
                    )
                    .kerning(0.29139)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                
                SchoolMessagesList().padding(.leading, -20)
                
            } .padding(.leading, 20)
                .tabItem{
                    Image(systemName: "graduationcap.circle.fill")
                    Text("Sch Msgs")
                    
                    
                }
            
            
            
            
            
            
            
            
            
            TutorXStudentMessageScreen()
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

#Preview {
    TutorHomePage(callViewModel: .init())
}
