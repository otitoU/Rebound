//
//  SchoolStatisticsScreen.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct SchoolStatisticsScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ImageTopBar()
                        .padding(.bottom, 20)
                    
                    Text("Meeting Summary")
                        .font(
                            Font.custom("SF Pro", size: 22)
                                .weight(.medium)
                        )
                        .kerning(0.29139)
                        .foregroundColor(.black)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    
                    MeetingSummaryList()
                        .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Insincenikkdxew")
            
        }


    }
}

#Preview {
    SchoolStatisticsScreen()
}
