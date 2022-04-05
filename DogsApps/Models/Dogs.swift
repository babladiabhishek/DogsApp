//
//  Dogs.swift
//  CatsDogs App
//
//  Created by Abhishek babladi on 2022-03-29.
//

import Foundation


typealias Dogs = [Dog]

// MARK: - Dog
struct Dog: Codable {
    let id: Int
    let name: String
    let image: Image
    let bredFor: String?
    let lifeSpan: String
    let temperament: String?
    
    
    enum CodingKeys: String, CodingKey {
            case id, name, image,temperament
            case bredFor = "bred_for"
            case lifeSpan = "life_span"
    }
}

struct Image : Codable {
    let url : String
}






