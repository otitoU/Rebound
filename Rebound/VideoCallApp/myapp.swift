//
//  myapp.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/28/23.
//

import SwiftUI

struct myapp: View {
    var action: () -> Void
    var body: some View {
        VStack {
            
           Text("Call ended!")
            Button(" Dismiss"){
                action()
            }
        }
    }
}

#Preview {
    myapp{}
}
