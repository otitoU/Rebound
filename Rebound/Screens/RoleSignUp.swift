//
//  RoleSignUp.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/21/23.
//

import SwiftUI

struct RoleSignUp: View {
    
    @State private var fullName : String = ""
    @State private var userName : String = ""
    @State private var email : String = ""
    @State private var confirmEmail : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var role: String
    
    
    var body: some View {
        
        VStack{
            ImageTitle()
            HStack(spacing: 2){
                Text("Sign up as a ")
                    .font(
                        Font.custom("Poppins", size: 20)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                NavigationLink(destination: RoleSelect()){
                    Text(role)
                        .font(Font.custom("Poppins", size: 20))
                        .foregroundColor(Color("brandPrimary"))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                }
                
                
            }
            
            
            VStack(spacing: 15) {
                TextField("Full name", text: $fullName)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                
                TextField("User name", text: $userName)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                
                TextField("Confirm email", text: $confirmEmail)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                SecureField("Confirm password", text: $confirmPassword)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 284, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
            }.padding()
            
            Button(){
                // check if the email and confirm email are the same
                // check if the password and confirm password are the same
                Task{
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullName: fullName,
                                                   role: role,
                                                   userName: userName
                                                   )
                }
            }label: {
                Text("Sign Up")
                    .frame(width: 137, height: 31)
                    .foregroundColor(.white)
                    .background(Color("brandPrimary"))
                    .cornerRadius(7)
                    .font(
                        Font.custom("Poppins", size: 16)
                            .weight(.bold)
                    )
            }
            
            Text("OR")
                .font(
                    Font.custom("Poppins", size: 14)
                        .weight(.black)
                )
                .foregroundColor(Color(red: 0.02, green: 0.14, blue: 0.37))
            
            HStack{
                Image("googlelogo")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Continue with Google")
                
            }.padding(15)
                .frame(width: 284)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
            
            NavigationLink(destination: RoleSignIn(role: role)
            ){
                Text("Already have an account? Log in")
                    .font(Font.custom("Poppins", size: 12))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0.02, green: 0.14, blue: 0.37))
                    .padding(.top, 4)
            }
            
            
            
            
            
            
            
            
        }
        
        
    }
    
    
    
}
struct RoleSignUp_Previews: PreviewProvider {
    static var previews: some View {
        RoleSignUp(role: "Tutor")
    }
}

