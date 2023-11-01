//
//  UnitList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/1/23.
//

import SwiftUI

struct UnitList: View {
    
    var image: String
    var text: String
    
    
    var body: some View {
       
            HStack(spacing:15) {
                Image(image)
                    .frame(width: 45, height: 45)
                    .background(Color("brandPrimary"))
                    .cornerRadius(12)
                   
                
                VStack(spacing: 19){
                    HStack {
                        Text(text)
                            .font(Font.custom("SF Pro", size: 17))
                            .foregroundColor(Color(.brandPrimary))
                            .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(Color(.brandPrimary))
                            .padding(.leading, -25)
                    }
                    .frame(width: 280)
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 280, height: 1)
                    .background(Color(red: 0.09, green: 0.35, blue: 0.04).opacity(0.27))

                }
            }
            .padding(.bottom, 19)
        
    }
}

#Preview {
    UnitList(image: "ListSuggestionImg", text: "biuwenijnweoidnowiemndoimwdoieqwmoidemqiomdnokwqndjxn wqjk xjqa xwkjwaxjunsaoixdnwoianqdxpiwk")
}
