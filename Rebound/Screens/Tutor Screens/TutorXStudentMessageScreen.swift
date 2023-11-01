//
//  TutorXStudentMessageScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct TutorXStudentMessageScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel
   
    
    
    var body: some View {
       
//        ChatChannelListView()
        VStack{
            ImageTopBar()
                .padding(.bottom, 32)
            
            
            HStack {
                
                
                Text("Messages")
                    .font(
                        Font.custom("SF Pro Text", size: 26)
                    )
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.bottom)
                
                Spacer()
                
            }
            .padding([.leading, .bottom], 20)
            
            NavigationView{
                StudentMessagesList()
                   
                                
            }
            
        }
        }
}

#Preview {
    TutorXStudentMessageScreen()
}
