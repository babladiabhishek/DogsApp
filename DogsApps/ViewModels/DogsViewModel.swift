//
//  DogsViewModel.swift
//  Created by Abhishek babladi on 2022-03-29.
//

import Foundation

class DogsListViewModel {
    private var dogService: AsyncAwaitDogsService
    //CollectionView
    var reloadCollectionView: (() -> Void)?
    var dogs = Dogs()
    var dogsCellViewModels = [DogCellViewModel]() {
        didSet {
            reloadCollectionView?()
        }
    }
    
    init(dogService: AsyncAwaitDogsService = WebService()) {
        self.dogService = dogService
    }
    
    func getDogsBreeds()  async {
        do {
            let dogData =    try  await dogService.fetchDogsBreed()
            self.fetchDogs(dogsData: dogData ?? [])
        } catch {
            print(error)
        }
        
    }
    
    
    func fetchDogs (dogsData :Dogs){
        self.dogs = dogsData
        dogsCellViewModels = dogsData.map {dog in createDogCellModel(dog: dog)}
    }
    
    
    func createDogCellModel(dog: Dog) -> DogCellViewModel {
        let id = dog.id
        let name = dog.name
        let imageUrl = dog.image.url
        return DogCellViewModel(name: name, id: id, url: imageUrl)
    }
    
    
    func getDogCellViewModel(at indexPath: IndexPath) -> DogCellViewModel {
        return dogsCellViewModels[indexPath.row]
    }
}
