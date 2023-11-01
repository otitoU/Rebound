//
//  EventCard.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct EventCard: View {
    
    @State var isEven: Bool
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("22 - 25")
                        .font(Font.custom("Raleway", size: 36))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    Text("September")
                        .font(Font.custom("Raleway", size: 28))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                Spacer()
                Image("eventImg")
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 15.0)
                
                
            }.padding(.bottom, 16)
            
            Text("Student week")
                .font(
                Font.custom("Raleway", size: 15)
                .weight(.medium)
                )
                
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.bottom, 8)
            
            Text("Students on campus experience a dynamic week filled with classes, extracurriculars, studying and social interactions")
              .font(Font.custom("Raleway", size: 12))
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.bottom, 12)
              .padding(.leading, -20)
              .frame(width: 260.0)
            
            HStack{
                Text("Volunteers needed")
                  .font(
                    Font.custom("Raleway", size: 15)
                      .weight(.medium)
                  )
                  .underline()
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Spacer()
                Image(systemName: "arrow.right")
            }

          
            
          
            
            
        }.padding(12)
            .frame(width: 326, alignment: .leading)
            .background(isEven ? Color(red: 0.09, green: 0.35, blue: 0.04) : Color(red: 0.3, green: 0.85, blue: 0.39))
            .foregroundColor(isEven ? .white : .black)
    }
}

#Preview {
    EventCard(isEven: false)
}
