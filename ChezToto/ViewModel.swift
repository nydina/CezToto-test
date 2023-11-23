//
//  ViewModel.swift
//  TajMahal
//
//  Created by Amandine Cousin on 14/11/2023.
//

import Foundation

class ViewModel {
    var menuArray: [TypeOfDish] = []
    
    init() {
        self.getData()
    }
    
    private func getData() {
        self.menuArray = ModelData().load("Source.json")
    }
    
    func removeDish(dishName: String) {
        self.menuArray[0].dishs.removeAll(where: { $0.name == dishName })
    }
    
    func addDish(dish: Dish, typeOfDish: String) {
        guard let idx = self.menuArray.firstIndex(where: { $0.name == typeOfDish }) else { return }
        self.menuArray[idx].dishs.append(dish)
    }
    
    func addNewTypeOfDish(typeOfDish: String) {
        let newType = TypeOfDish(name: typeOfDish, dishs: [])
        self.menuArray.append(newType)
    }
}
