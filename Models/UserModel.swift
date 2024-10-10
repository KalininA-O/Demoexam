//
//  UserModel.swift
//  Test_project
//
//  Created by user on 09.10.2024.
//

import Foundation
struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone_number: String
    var created_at: Date
}

