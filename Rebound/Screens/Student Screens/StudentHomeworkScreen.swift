//
//  StudentHomeworkScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/30/23.
//

import SwiftUI

struct StudentHomeworkScreen: View {
    var body: some View {
        VStack{
            ImageTopBar()
                .padding(.bottom, 32)
            
            HStack {
                
                
                Text("Assignments")
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
            
            AssignmentResourcesList()
        }
    }
}

#Preview {
    StudentHomeworkScreen()
}
