//
//  Webservice.swift
//  CatsDogs App
//
//  Created by Abhishek babladi on 2022-03-29.
//

import Foundation

protocol AsyncAwaitDogsService{
  func fetchDogsBreed() async throws -> Dogs?
}

class WebService:AsyncAwaitDogsService {
  func fetchDogsBreed() async throws -> Dogs? {
    guard let urlString = URL(string: Constants.Urls.dogsBreedUrl) else { return [] }
    let (data,_) =  try await URLSession.shared.data(from: urlString)
    guard let dogs = try? JSONDecoder().decode(Dogs.self, from: data) else {return []}
    return dogs
  }
  
}
