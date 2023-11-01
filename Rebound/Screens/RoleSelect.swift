//
//  RoleSelect.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/20/23.
//

import SwiftUI

struct RoleSelect: View {
    
    @State private var showingSignUp = false
    
    
    
    var body: some View {
        
        
        VStack{
            
            
            ImageTitle()
                .padding([.top, .bottom] , 20)
            Spacer()
            
            Text("Hello!")
                .font(Font.custom("SF Pro Rounded", size: 35)
                    .weight(.bold))
                .foregroundColor(.black)
            Text("Who will you be joining as today?")
                .font(Font.custom("SF Pro Rounded", size: 17)
                    .weight(.bold))
                .foregroundColor(.black)
                .padding(.bottom, 22)
            
            
            
            NavigationLink(destination: RoleSignIn(role: "Tutor")){
                
                BlackButton(text: "I am a Tutor")
                    .padding(.bottom, 10)
                
                
            }
            
            NavigationLink(destination: RoleSignIn(role: "Teacher")){
                
                BlackButton(text: "I am a Teacher")
                    .padding(.bottom, 10)
                
                
            }
            
            NavigationLink(destination: RoleSignIn(role: "Student")){
                
                BlackButton(text: "I am a Student")
                    .padding(.bottom, 10)
                
                
            }
            
            
            
            
            Spacer()
            Spacer()
            Spacer()
            
            
            
            
        }
    }
}

struct RoleSelect_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelect()
    }
}
