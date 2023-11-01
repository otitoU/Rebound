//
//  ImageTitle.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/20/23.
//

import SwiftUI

struct ImageTitle: View {
    var body: some View {
        Image("ReboundLogo")
            .resizable()
            .frame(width: 248.27, height: 98)
    }
}

struct ImageTitle_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitle()
    }
}
