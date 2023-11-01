//
//  FileMetadata.swift
//  Rebound
//
//  Created by Otito Udedibor on 10/5/23.
//

import Foundation
import FirebaseFirestoreSwift

struct FileMetadata:  Identifiable, Codable {
    var id: String 
    var url: URL
    var filename: String
}
