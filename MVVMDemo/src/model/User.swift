//
//  User.swift
//  MVVMDemo
//
//  Created by Jordan Lin on 2019/1/30.
//  Copyright © 2019 Jordan Lin. All rights reserved.
//

import Foundation
//{
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//        "street": "Kulas Light",
//        "suite": "Apt. 556",
//        "city": "Gwenborough",
//        "zipcode": "92998-3874",
//        "geo": {
//            "lat": "-37.3159",
//            "lng": "81.1496"
//        }
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//        "name": "Romaguera-Crona",
//        "catchPhrase": "Multi-layered client-server neural-net",
//        "bs": "harness real-time e-markets"
//    }
//}
struct User: Codable {
    let id: Int
    let name: String
    let userName: String?
    let email: String?
    let address: Address?
    let phone: String?
    let website: String?
    let company: Company?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, address, phone, website, company
        case userName = "username"
    }
}

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipCode: String?
    let geo: Geo?
    
    enum CodingKeys: String, CodingKey {
        case street, suite, city, geo
        case zipCode = "zipcode"
    }
}

struct Geo: Codable {
    let lat: String?
    let lng: String?
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
