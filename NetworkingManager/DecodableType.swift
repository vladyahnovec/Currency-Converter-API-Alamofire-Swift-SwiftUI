//
//  DecodableType.swift
//  Networking_l1
//
//  Created by Круглич Влад on 13.04.24.
//

import Foundation

struct DecodableType: Codable, Hashable {
    let Date : String
    let Valute: [String: ValuteItems]
}

struct ValuteItems: Codable, Hashable {
    let id, numCode, charCode: String
    let nominal: Int
    let name: String
    let value, previous: Double
    
    enum CodingKeys: String, CodingKey, Hashable {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
