//
//  ContentView.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/5/23.
//

import SwiftUI
import FirebaseAuth
import StreamVideoSwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var callViewModel: CallViewModel
    
    
    
    var body: some View {
//if yes-> counsellor take me to school
          
        NavigationView{
            
            if viewModel.userSession != nil{
               
                switch viewModel.currentUser?.role{
                case "Tutor":
                    TutorHomePage(callViewModel: callViewModel)
                    
//                case "Teacher":
//                    SchoolHomePage()
              
                case "Student":
                    StudentHomePage(callViewModel: callViewModel)

                default:
                    
                    HStack{
                        Text("Hey, I am signing you in...")
                        Button(){
                            // check if the email and confirm email are the same
                            // check if the password and confirm password are the same
                            Task{
                                try viewModel.signOut()
                            }
                        }label: {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.top, 16)
                                .foregroundColor(Color("brandPrimary"))
                        }
                    }
                        .onAppear{
                            print(viewModel.currentUser)
                        }
                }
 

            }
            else{
                RoleSelect()
            }
         
        } .onAppear{
            print(viewModel.currentUser)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(callViewModel: .init())
        }
    }
}
