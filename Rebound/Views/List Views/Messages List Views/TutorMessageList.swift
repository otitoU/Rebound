//
//  TutorMessageList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/13/23.
//

import SwiftUI

struct TutorMessageList: View {
    
    @State var showingMessages = false
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: MessagesView()){
                    Button{
                        showingMessages.toggle()
                    }label:{
                        MessageUnitList(image: "KendraImg", name: "Alex Pina", message:"", timeSent: "10:30am")
                    }
                }
                               
//
//                MessageUnitList(image: "SchoolIcon", name: "Alex Harvey", message:"Can I see you soon?", timeSent: "9:30am")
               
               
            }
        }.sheet(isPresented: $showingMessages){ Messages1View()
                
        }
    }
}

#Preview {
    TutorMessageList()
}
