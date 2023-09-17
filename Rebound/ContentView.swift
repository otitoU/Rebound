//
//  ContentView.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("ReboundLogo")
                .resizable()
                .frame(width: 240, height: 98)
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
