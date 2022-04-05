//
//  AttributesViewModel.swift
//  DogsApps
//
//  Created by Abhishek babladi on 2022-04-01.
//

import Foundation


class AttributesViewModel {

    var attributesList = Dogs()
    
    var attributesCellViewModels = [AttributesCellViewModel]()

    
    func fetchDogAttributes(dogsData:Dogs){
        self.attributesList = dogsData
        var vms = [AttributesCellViewModel]()
        for attributes in dogsData {
            vms.append(createDogAttributes(dog: attributes))
        }
        attributesCellViewModels = vms
    }
    

    func createDogAttributes(dog:Dog) -> AttributesCellViewModel {
        let temperament = dog.temperament
        let lifeSpan = dog.lifeSpan
        let bredFor =  dog.bredFor
        return AttributesCellViewModel(temperament: temperament ?? "nil", lifeSpan: lifeSpan, bredFor: bredFor ?? "nil")
    }
     
   
    func getAttributesCellViewModel(at indexPath: IndexPath) -> AttributesCellViewModel {
        return attributesCellViewModels[indexPath.row]
    }
    }
    
