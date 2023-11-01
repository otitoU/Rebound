//
//  VideoCallApp.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/28/23.
//




import SwiftUI
import Firebase
import StreamVideo
import StreamVideoSwiftUI

@main
struct VideoCallApp: App {
    @StateObject var viewModel = AuthViewModel()
    @ObservedObject var callViewModel: CallViewModel
    
    private var client: StreamVideo
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "General_Crix_Madine" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiR2VuZXJhbF9Dcml4X01hZGluZSIsImlzcyI6InByb250byIsInN1YiI6InVzZXIvR2VuZXJhbF9Dcml4X01hZGluZSIsImlhdCI6MTY5ODQ5NzY4NywiZXhwIjoxNjk5MTAyNDkyfQ._OVsjnnNHswm5i80oYhctGGEEukC0slMtLMi1DpiSew" // The Token can be found in the Credentials section
    private let callId: String = "kYuMQUxr6hbg" // The CallId can be found in the Credentials section
    
    init() {
        FirebaseApp.configure()
        self.callViewModel = .init()
        let user = User(
            id: userId,
            name: "Kendra",// name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )
     
        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )
        

     
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                if viewModel.callStarted{
                    if callViewModel.call != nil {
                        CallContainer(viewFactory: DefaultViewFactory.shared, viewModel: callViewModel)
                    } else {
                       
                        myapp{
                            viewModel.callStarted = false
                        }
                        
                    }
                }
                else{
                    ContentView(callViewModel: callViewModel)
                        .environmentObject(viewModel)
                }

            }
        }
    }
}
