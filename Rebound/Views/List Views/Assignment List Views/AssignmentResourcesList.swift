//
//  AssignmentResourcesList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/2/23.
//

import SwiftUI
import FirebaseStorage

struct AssignmentResourcesList: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var isPreviewing = false
    @State var selectedFileURL: URL?
    
    var body: some View {
        ScrollView{
            
            
            ForEach(viewModel.metadata) { assignment in
                      // Display each document's data in your custom UI
//                Text(assignment.url)
                Button{
                    selectedFileURL = URL(string: assignment.url) // Convert the URL string to URL
                    isPreviewing = true
                }label: {
                    UnitList(image: "assignmentResourceImg", text: assignment.filename)
                          // Add more views to display other data as needed
                      }
                     
            }.sheet(isPresented: $isPreviewing){
                if let selectedFileURL = selectedFileURL {
                                  PDFPreviewView(fileURL: selectedFileURL)
                              }
            } .onAppear {
                // Fetch data when the view appears
                Task{
                    await viewModel.fetchFiles()
                }
                 
            }
              
//            VStack{
//                
//                //should get data from an array and dynamicalluy display it
//                UnitList(image: "assignmentResourceImg", text: "Chemistry Assignment")
//                UnitList(image: "assignmentResourceImg", text: "History Assignment")
//                UnitList(image: "assignmentResourceImg", text: "Pre Caculus Lab")
//                UnitList(image: "assignmentResourceImg", text: "Spanish Assignment")
//                UnitList(image: "assignmentResourceImg", text: "Psyc 101 Assignment")
//                UnitList(image: "assignmentResourceImg", text: "Business Studies Assignment")
//               
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//            }
        }
        
    }
}

#Preview {
    AssignmentResourcesList()
}
