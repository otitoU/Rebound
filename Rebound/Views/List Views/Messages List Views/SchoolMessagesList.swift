//
//  SchoolMessagesList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct SchoolMessagesList: View {
    var body: some View {
        ScrollView{
            VStack{
                MessageUnitList(image: "SchoolIcon", name: "Professor Chad", message:"Good day Tutors, I hope ...", timeSent: "10:30am")
                MessageUnitList(image: "SchoolIcon", name: "Professor Lucy", message:"I noticed Kelly is doing better", timeSent: "8:30am")
               
               
            }
        }
       
    }
}

#Preview {
    SchoolMessagesList()
}
