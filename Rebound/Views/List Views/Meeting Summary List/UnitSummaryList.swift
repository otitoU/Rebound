//
//  UnitSummaryList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/6/23.
//

import SwiftUI

struct UnitSummaryList: View {
    
    var image: String
    var name: String
    var message: String
    var timeSent: String
    
    
    var body: some View {
        NavigationLink(destination:  MeetingSummaryScreen()){
            VStack {
                HStack(spacing: 18) {
                    Image(image)
                        .frame(width: 50, height: 50)
                        .background(Color("brandTertiary"))
                        .cornerRadius(12)
                    
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(name)
                            .font(Font.custom("SF Pro", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text(message)
                                .foregroundColor(Color(.brandTertiary))
                            
                            Spacer()
                            Text(timeSent)
                                .font(
                                Font.custom("SF Pro", size: 12)
                                .weight(.bold)
                                )
                                .kerning(0.5)
                                .foregroundColor(Color(.brandPrimary))
                                .padding(.leading, -25)
                        }
                        .frame(width: 280)
                        
                        
                        
                        
                        //                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        
                    }
                }
                .padding(.bottom, 3)
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 1)
                    .background(Color(red: 0.09, green: 0.35, blue: 0.04).opacity(0.27))
                    .padding(.bottom, 19)
            }//end of vstack
            
        }
    }
}

#Preview {
    UnitSummaryList(image: "SchoolIcon", name: "Aisha Ali and Kendar Shephard", message:"View more", timeSent: "09/17/23")
}
