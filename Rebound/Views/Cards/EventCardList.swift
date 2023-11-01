//
//  EventCardList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct EventCardList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                EventCard(isEven: true)
                EventCard(isEven: false)
                EventCard(isEven: true)
            }
           
        }
    }
}

#Preview {
    EventCardList()
}
