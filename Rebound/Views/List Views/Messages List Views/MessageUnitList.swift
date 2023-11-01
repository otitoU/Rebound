//
//  MessageUnitList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct MessageUnitList: View {
    var image: String
    var name: String
    var message: String
    var timeSent: String
    
    
    var body: some View {
            HStack(spacing: 18) {
                Image(image)
                    .frame(width: 50, height: 50)
                    .background(Color("brandTertiary"))
                    .cornerRadius(12)
                
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(name)
                            .font(Font.custom("SF Pro", size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.brandPrimary))
                        Spacer()
                        Text(timeSent)
                            .font(Font.custom("SF Pro", size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.brandPrimary))
                            .padding(.leading, -25)
                    }
                    .frame(width: 280)
                    
                    Text(message)
                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    
                }
            }
            .padding(.bottom, 19)
        
    }
}

#Preview {
    MessageUnitList(image: "SchoolIcon", name: "Professor Chad", message:"Good day Tutors, I hope ...", timeSent: "10:30am")
}
