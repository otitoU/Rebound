//
//  MeetingSummaryList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/6/23.
//

import SwiftUI

struct MeetingSummaryList: View {
    
    var body: some View {
        
        VStack {
            UnitSummaryList(image: "SchoolIcon", name: "Aisha Ali and Kendar Shephard", message:"View more", timeSent: "09/17/23")
            UnitSummaryList(image: "SchoolIcon", name: "Aisha Ali and Kendar Shephard", message:"View more", timeSent: "09/17/23")
            UnitSummaryList(image: "SchoolIcon", name: "Aisha Ali and Kendar Shephard", message:"View more", timeSent: "09/17/23")
        
    }
}
}

#Preview {
    MeetingSummaryList()
}
