//
//  StudentMessagesList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/3/23.
//

import SwiftUI

struct StudentMessagesList: View {
//    @EnvironmentObject var viewModel: AuthViewModel
    @State var showingMessages = false
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: MessagesView()){
                    Button{
                        showingMessages.toggle()
                    }label:{
                        MessageUnitList(image: "KendraImg", name: "Kendra Shepard", message:"I got a B on my paper!", timeSent: "10:30am")
                    }
                }
                               
//                
//                MessageUnitList(image: "SchoolIcon", name: "Alex Harvey", message:"Can I see you soon?", timeSent: "9:30am")
               
               
            }
        }.sheet(isPresented: $showingMessages){ MessagesView()
                
        }
    }
}

#Preview {
    StudentMessagesList()
}
