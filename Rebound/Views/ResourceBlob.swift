//
//  ResourceBlob.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/30/23.
//

import SwiftUI

struct ResourceBlob: View {
    var image: String
    
    var resourceType: String
    
    var body: some View {
        
        VStack {
            ZStack{
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 159, height: 159)
                .background(.black)
                .cornerRadius(14)
                
                Image(image)
            }
            .padding(.bottom, 15)
            
            Text(resourceType)
                .font(
                Font.custom("SF Pro", size: 15)
                .weight(.semibold)
                )
                .foregroundColor(.black)
                .frame(width: 150, alignment: .topLeading)
            
                
        }
        .padding(.bottom)
        
    }
}

#Preview {
    ResourceBlob(image: "learningResourceImg", resourceType: "tooo")
}
