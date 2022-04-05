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
    var dogss:Dogs? = nil
    func fetchDogsBreed() async throws -> Dogs? {
        guard let urlString = URL(string: Constants.Urls.dogsBreedUrl) else { return [] }
        if #available(iOS 15.0, *) {
            let (data,response) =  try await URLSession.shared.data(from: urlString)
            print(response)
            let dogs = try? JSONDecoder().decode(Dogs.self, from: data)
            print(dogs!)
            return dogs
        } else {
            // Fallback on earlier versions
            AF.request(urlString).responseJSON  { response in
                print(response.value!)
                switch response.result {
                case .success(let value):
                    print(response.value!)
                    self.dogss = try? JSONDecoder().decode(Dogs.self, from: value as! Data)
                    print(self.dogss ?? [])
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            return self.dogss
        }
       
    }
    
}
