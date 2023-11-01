//
//  WellnessResourcesList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/2/23.
//

import SwiftUI

struct WellnessResourcesList: View {
    var body: some View {
        ScrollView{
            VStack{
                
                //should get data from an array and dynamicalluy display it
                UnitList(image: "ListVideoImg", text: "Coping with Loss")
                UnitList(image: "ListSuggestionImg", text: "Things you can control")
                //            UnitList(image: "ListVideoImg", text: /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                //            UnitList(image: "ListVideoImg", text: /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }.padding()
    }
}

#Preview {
    WellnessResourcesList()
}
