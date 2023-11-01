//
//  UnitAssignmentList.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/5/23.
//

import SwiftUI

struct UnitAssignmentList: View {
    
    var fileObj: FileModel
    @Binding var fileModels: [FileModel]
    
    
    var body: some View {
        HStack{
            Text(fileObj.filename)
            Spacer()
            Button{
                if let index = fileModels.firstIndex(where: { $0.filename == fileObj.filename }) {
                                  fileModels.remove(at: index)
                              }
            }label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .frame(width: 281, height: 36)
        .padding(8.3)
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .inset(by: 0.5)
                .stroke(Color(red: 0.07, green: 0.69, blue: 0.13), lineWidth: 1)
        )
        
    }
}

//#Preview {
// 
//    UnitAssignmentList(fileObj: FileModel(url: URL(string: "https://example.com/sample.pdf")!, filename: "Sample.pdf"), fileModels: [FileModel(url: URL(string: "https://example.com/sample.pdf")!, filename: "Sample.pdf")])
//}
struct UnitAssignmentList_Preview: PreviewProvider {
    static var previews: some View {
        let sampleFileModel = FileModel(url: URL(string: "https://example.com/sample.pdf")!, filename: "Sample.pdf")
        let fileModels: [FileModel] = [sampleFileModel]

        return UnitAssignmentList(fileObj: sampleFileModel, fileModels: .constant(fileModels))
    }
}
