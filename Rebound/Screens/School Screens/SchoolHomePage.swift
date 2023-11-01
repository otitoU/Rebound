//
//  SchoolHomePage.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct SchoolHomePage: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        TabView{
            //school messages
            
//
            
            
            
            VStack(alignment: .leading){
                ImageTopBar()
                    .padding(.bottom, 32)
                    .padding(.leading, -20)
                
                Text(viewModel.currentUser?.fullName ?? "Gregory Henderson")
                .font(
                Font.custom("SF Pro", size: 22)
                .weight(.medium)
                )
                .kerning(0.29139)
                .foregroundColor(.black)
                .padding(.leading, -1)
                .padding(.bottom, 19)
                
                Text("School Events")
                .font(
                Font.custom("SF Pro", size: 20)
                .weight(.medium)
                )
                .kerning(0.29139)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                EventCardList()
                    .padding(.bottom, 30)
                
                Text("Messages")
                .font(
                Font.custom("SF Pro", size: 20)
                .weight(.medium)
                )
                .kerning(0.29139)
                .foregroundColor(.black)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .topLeading)

                
                SchoolMessagesList()
                
            } .padding(.leading, 20)
            .tabItem{
                

                   
                    Text("Sch Msgs")
                
                
                
            }
            
          
           
            
            
            SchoolStatisticsScreen()
            .tabItem{
                VStack(){

                    Text("Statistics")
                }
                
                
            }
            
            SchoolFileUploadScreen()
            .tabItem{
                VStack(){

                    Text("Uploads")
                }
                
                
            }
            
           
                
                
            
            
            
            
        }
        .background(Color.red)
    }
}

#Preview {
    SchoolHomePage()
}
