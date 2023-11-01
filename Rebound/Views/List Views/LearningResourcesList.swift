//
//  LearningResourcesList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/2/23.
//

import SwiftUI

struct LearningResourcesList: View {
    var body: some View {
        ScrollView{
            VStack{
                
                //should get data from an array and dynamicalluy display it
                UnitList(image: "ListVideoImg", text: "Khan Academy")
                UnitList(image: "ListSuggestionImg", text: "Quizlet")
                UnitList(image: "ListSuggestionImg", text: "Mathway")
                UnitList(image: "ListSuggestionImg", text: "Chat Gpt")
                UnitList(image: "ListSuggestionImg", text: "Grammarly")
                UnitList(image: "ListSuggestionImg", text: "Udemy")
                UnitList(image: "ListSuggestionImg", text: "Coursera")
                //            Spacer()
                Spacer()
                Spacer()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    LearningResourcesList()
}
