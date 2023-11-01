//
//  User.swift
//  Rebound
//
//  Created by Otito Udedibor on 9/22/23.
//

import Foundation

struct Userr: Identifiable, Codable {
    let id: String
    let userName: String
    let fullName: String
    let email: String
    var role: String
    
}
