//
//  Webservice.swift
//  CatsDogs App
//
//  Created by Abhishek babladi on 2022-03-29.
//

import Foundation
import Alamofire

protocol AsyncAwaitDogsService{
    func fetchDogsBreed() async throws -> Dogs?
}

class WebService:AsyncAwaitDogsService {
    func fetchDogsBreed() async throws -> Dogs? {
        guard let urlString = URL(string: Constants.Urls.dogsBreedUrl) else { return [] }
        if #available(iOS 15.0, *) {
            let (data,_) =  try await URLSession.shared.data(from: urlString)
            guard let dogs = try? JSONDecoder().decode(Dogs.self, from: data) else {return []}
            return dogs
        } else {
            // Fallback on earlier versions
            AF.request(urlString).responseJSON  { response in
                switch response.result {
                case .success(let value):
                    _ = try? JSONDecoder().decode(Dogs.self, from: value as! Data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
}
