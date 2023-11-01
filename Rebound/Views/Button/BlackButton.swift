//
//  BlackButton.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/20/23.
//

import SwiftUI

struct BlackButton: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 47)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(7)
            .padding(.bottom)
      
        
        
        
    }
    
    
}

struct BlackButton_Previews: PreviewProvider {
    static var previews: some View {
        BlackButton(text: "I am a Tutor")
    }
}
