//
//  StudentResourcesScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/30/23.
//

import SwiftUI

struct StudentResourcesScreen: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        VStack{
            ImageTopBar()
                .padding(.bottom, 39)
            
        
            
            NavigationView{
                ScrollView{
                    LazyVGrid(columns: columns){
                        
                        NavigationLink(destination:  WellnessResourcesList()){
                            ResourceBlob(image: "wellnessResourceImg", resourceType: "Wellness Resources")
                        }
                        
                        NavigationLink(destination:  LearningResourcesList()/*.navigationBarBackButtonHidden(true)*/){
                            ResourceBlob(image: "learningResourceImg", resourceType: "Learning Resources")
                            
                        }
                        
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 159, height: 159)
                                .cornerRadius(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .inset(by: 1)
                                        .stroke(.black, lineWidth: 2)
                                )
                            
                            
                            VStack{
                                Image("blackplussign")
                                Text("Add")
                            }
                        }
                        
                        
                        
                    }
                    
                }
                
                .navigationTitle("Resources")
            }
            .padding(.top, -43)
            
            Spacer()
            
            
        }
        
    }
}

#Preview {
    StudentResourcesScreen()
}
//HStack {
//    
//    
//    Text("Resources")
//    .font(
//    Font.custom("SF Pro Text", size: 26)
//    .weight(.medium)
//    )
//    .multilineTextAlignment(.center)
//    .foregroundColor(.black)
//    .padding(.bottom, 15)
//    
//    Spacer()
//    
//}
//.padding(.leading, 20)
