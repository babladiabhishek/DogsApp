//
//  Constants.swift
//  DogsApp
//
//  Created by Abhishek babladi on 2022-03-29.
//

import Foundation

struct Constants {
    enum NetworkError: Error {
        case badUrl
        case decodingError
        case badRequest
    }
    struct Urls {
        static let dogsBreedUrl: String = "https://api.thedogapi.com/v1/breeds?attach_breed=1"
    }
    
    struct ReuseIdentifiers{
        static let tableViewIdentifier:String  = "Cell"
        static let collectionViewIdentifier:String = "cell"
    }
    
}
