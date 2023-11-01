//
//  MeetingSummaryScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/6/23.
//

import SwiftUI

struct MeetingSummaryScreen: View {
    var body: some View {
       ScrollView
        {
            
            
            VStack(alignment: .leading){
//                ImageTopBar()
//                
//                    .padding(.bottom, 32)
                
                HStack {
                    Text("Meeting Summary")
                        .font(
                            Font.custom("SF Pro", size: 22)
                                .weight(.medium)
                        )
                        .kerning(0.29139)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    
                    Spacer()
                    HStack {
                        Image("alarmclock")
                        
                        Text("1hr 04min")
                            .font(
                                Font.custom("SF Pro", size: 15)
                                    .weight(.medium)
                            )
                            .kerning(0.29139)
                            .foregroundColor(Color(red: 0.09, green: 0.35, blue: 0.04))
                    }.padding(.top, -14)
                        .padding()
                }
                
                
                VStack(alignment: .leading, spacing:7){
                    Text("Kendra S.(109335)")
                        .font(Font.custom("SF Pro", size: 14))
                        .kerning(0.29139)
                        .foregroundColor(Color(red: 0.09, green: 0.35, blue: 0.04).opacity(0.54))
                    
                    Image(systemName: "arrow.up.arrow.down")
                    
                    Text("Aisha Ali")
                        .font(Font.custom("SF Pro", size: 14))
                        .kerning(0.29139)
                        .foregroundColor(Color(red: 0.09, green: 0.35, blue: 0.04).opacity(0.54))
                    
                }.padding(.leading, 20)
                    .padding(.bottom, 15)
                
                
                Text("Topics")
                    .font(
                        Font.custom("SF Pro", size: 16)
                            .weight(.bold)
                    )
                    .kerning(0.29139)
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43)).padding(.leading)
                HStack{
                    Image("piechat1")
                    
                    
                    
                    VStack(spacing:10){
                        HStack{
                            Circle().frame(width: 15)
                            Text("Chemistry ")
                                .font(
                                    Font.custom("SF Pro", size: 16)
                                        .weight(.light)
                                )
                                .kerning(0.29139)
                                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                        }
                        HStack{
                            Circle().frame(width: 15).foregroundColor(.gray)
                            Text("VolleyBall ")
                                .font(
                                    Font.custom("SF Pro", size: 16)
                                        .weight(.light)
                                )
                                .kerning(0.29139)
                                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                        }.padding(.leading, -3)
                        HStack{
                            Circle().frame(width: 15).foregroundColor(Color(red: 0.01, green: 0.7, blue: 0.01))
                            Text("Chemistry ")
                                .font(
                                    Font.custom("SF Pro", size: 16)
                                        .weight(.light)
                                )
                                .kerning(0.29139)
                                .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                        }
                        
                        VStack{
                            Text("View More")
                                .font(
                                    Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                )
                                .kerning(0.29139)
                                .foregroundColor(Color(red: 0.09, green: 0.35, blue: 0.04))
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 70, height: 1)
                                .background(Color(red: 0.09, green: 0.35, blue: 0.04))
                        }
                    }.padding(.leading, 30)
                        .padding(.top)
                }
                
                
                Text("Wellness")
                    .font(
                        Font.custom("SF Pro", size: 16)
                            .weight(.bold)
                    )
                    .kerning(0.29139)
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43)).padding(.leading).padding(.bottom, 4)
                HStack(spacing: 55){
                    VStack{
                        Text("Before the meeting ")
                            .font(
                                Font.custom("SF Pro", size: 14)
                                    .weight(.light)
                            )
                            .kerning(0.29139)
                            .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                        
                        ZStack{
                            Image("greencircle")
                            Image("blackcut")
                        }.padding(.bottom, 4)
                        
                        VStack(alignment: .leading, spacing:10){
                            HStack{
                                Circle().frame(width: 15)
                                Text("Sad ")
                                    .font(
                                        Font.custom("SF Pro", size: 16)
                                            .weight(.light)
                                    )
                                    .kerning(0.29139)
                                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                            }
                            HStack(){
                                Circle().frame(width: 15).foregroundColor(Color(red: 0.01, green: 0.7, blue: 0.01))
                                Text("Happy ")
                                    .font(
                                        Font.custom("SF Pro", size: 16)
                                            .weight(.light)
                                    )
                                    .kerning(0.29139)
                                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                            }
                        }
                        
                        
                    }
                    VStack{
                        Text("Before the meeting ")
                            .font(
                                Font.custom("SF Pro", size: 14)
                                    .weight(.light)
                            )
                            .kerning(0.29139)
                            .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                        
                        ZStack{
                            Image("blackcircle")
                            Image("greencut")
                        }.padding(.bottom, 4)
                        
                        VStack(alignment: .leading, spacing:10){
                            HStack{
                                Circle().frame(width: 15)
                                Text("Sad ")
                                    .font(
                                        Font.custom("SF Pro", size: 16)
                                            .weight(.light)
                                    )
                                    .kerning(0.29139)
                                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                            }
                            HStack(){
                                Circle().frame(width: 15).foregroundColor(Color(red: 0.01, green: 0.7, blue: 0.01))
                                Text("Happy ")
                                    .font(
                                        Font.custom("SF Pro", size: 16)
                                            .weight(.light)
                                    )
                                    .kerning(0.29139)
                                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.43))
                            }
                        }
                        
                        
                    }
                }.padding(.leading ,30)
                
                Spacer()
                
            }
            
        }
    }
}

#Preview {
    MeetingSummaryScreen()
}
