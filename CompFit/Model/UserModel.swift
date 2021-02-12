//
//  UserModel.swift
//  CompFit
//
//  Created by Gabriel Dalessandro on 1/23/21.
//

import Foundation

struct UserModel: Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var totalPoints: Int?
    var gender: Int?
    
    
    
    init(id: Int?, firstName: String?, lastName: String?, email: String?, password: String?, totalPoints: Int?, gender: Int?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.totalPoints = totalPoints
        self.gender = gender
    }
    
    init(email: String, password: String){
        self.id = nil
        self.firstName = nil
        self.lastName = nil
        self.email = email
        self.password = password
        self.totalPoints = nil
        self.gender = nil
    }
    
    enum CodingKeys : String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case password
        case totalPoints = "total_points"
        case gender
    }
}

