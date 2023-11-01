//
//  HomePage.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/23/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
            ImageTitle()
            Spacer()
            Link("Learn SwiftUI", destination: URL(string: "file:///Users/ot/Library/Developer/CoreSimulator/Devices/D3D3D25B-0C3E-4615-BFEB-EB780C47DF42/data/Containers/Shared/AppGroup/91D00882-8EA5-4B2B-A0BF-71A4F42F4A7D/File%20Provider%20Storage/Testinggg.pdf")!)
            Image("OpenIcon")
            Spacer()
            Spacer()
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
