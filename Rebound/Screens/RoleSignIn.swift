//
//  RoleSignIn.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/20/23.
//

import SwiftUI

struct RoleSignIn: View {
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
                Text("Sign in as a ")
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
            Spacer()
            
            VStack(spacing: 15) {
                
                
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 354, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
                
            
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 354, height: 56, alignment: .center)
                    .background(Color("brandSecondary").cornerRadius(7))
                    .font(.headline)
                
            }.padding()
            
            Button{
                Task{
                    try await viewModel.signIn(withEmail: email,
                                               password: password,
                                               role: role)
                    await viewModel.fetchUser()
                }
                 
            }label: {
                Text("Sign In")
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
            
            NavigationLink(destination: RoleSignUp(role: role)
            ){
                Text("Don't have an account? Sign Up")
                    .font(Font.custom("Poppins", size: 12)
                        )
                    .foregroundColor(Color(red: 0.02, green: 0.14, blue: 0.37))
                    .padding(.top, 4)
            }
            
            
            
            Spacer()
            Spacer()
            
            
            
            
        }
        
        
    }
    
          
      
        
    
}

struct RoleSignIn_Previews: PreviewProvider {
    static var previews: some View {
        RoleSignIn(role: "Tutor")
    }
}
//Ot1@gmail.com
//otito123
