//
//  ImageTopBar.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/30/23.
//

import SwiftUI

struct ImageTopBar: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        HStack{
            Image("ReboundLogo")
                .resizable()
                .frame(width: 114, height: 50)
            
            Spacer()
            
            
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
        .padding([.leading, .trailing],20)
    }
}

#Preview {
    ImageTopBar()
}
