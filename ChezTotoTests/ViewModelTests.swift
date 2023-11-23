//
//  ViewModelTests.swift
//  ChezTotoTests
//
//  Created by Dina RAZAFINDRATSIRA on 23/11/2023.
//

import XCTest
@testable import ChezToto

final class ViewModelTests: XCTestCase {
    var viewModel: ViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = ViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testAddDish() throws {
        // given
        viewModel.menuArray = [mockTypeOfDishWithoutADish]
        
        let dishToAppend = mockDish
        
        // when
        viewModel.addDish(dish: dishToAppend, typeOfDish: mockTypeOfDishWithoutADish.name)
        
        // then
        XCTAssertFalse(viewModel.menuArray.isEmpty, "menuArray should not be empty after adding a dish")
        
    }
    
    func testAddDishToNonExistentType() throws {
        // given
        viewModel.menuArray = []
        XCTAssertTrue(viewModel.menuArray.isEmpty, "Initial condition: menuArray should be empty")

        let dishToAppend = mockDish
        let nonExistentType = "NonExistentType"

        // when
        viewModel.addDish(dish: dishToAppend, typeOfDish: nonExistentType)

        // then
        XCTAssertTrue(viewModel.menuArray.isEmpty, "menuArray should remain empty if trying to add a dish to a non-existent type of dish")
    }
    
    func testAddNewTypeOfDish() throws {
        // given
        viewModel.menuArray = []
        XCTAssertTrue(viewModel.menuArray.isEmpty, "Initial condition: menuArray should be empty")

        let newType = TypeOfDish(name: "Dessert", dishs: [])

        // when
        viewModel.addNewTypeOfDish(typeOfDish: newType.name)

        // then
        XCTAssertFalse(viewModel.menuArray.isEmpty, "menuArray should not be empty after adding a new type of dish")
        
        let addedType = viewModel.menuArray.first(where: { $0.name == newType.name })
        XCTAssertNotNil(addedType, "Added type of dish should be present in menuArray")
    }
    
    func testRemoveDish() throws {
        viewModel.menuArray = [mockTypeOfDishWithADish]
        // given
        let dishName = "Spaghetti Bolognese"
        
        // when
        viewModel.removeDish(dishName: dishName)
        
        // then
        XCTAssertTrue(viewModel.menuArray[0].dishs.filter { $0.name == dishName }.isEmpty)
    }
    
    func testRemoveDishNonExistent() throws {
        // given
        viewModel.menuArray = [mockTypeOfDishWithoutADish]
        XCTAssertTrue(viewModel.menuArray[0].dishs.isEmpty, "Initial condition: dishs array should be empty")

        let nonExistentDishName = "NonExistentDish"

        // when
        viewModel.removeDish(dishName: nonExistentDishName)

        // then
        XCTAssertTrue(viewModel.menuArray[0].dishs.isEmpty, "Dish array should remain empty if trying to remove a non-existent dish")
    }

}

// Mock a Dish
fileprivate let mockDish = Dish(
    name: "Spaghetti Bolognese",
    description: "Classic Italian pasta with meat sauce",
    pictureName: "spaghetti_image",
    price: 12.99
)

// Mock a TypeOfDish with the mockDish
fileprivate let mockTypeOfDishWithADish = TypeOfDish(
    name: "Main Course",
    dishs: [mockDish]
)

// Mock a TypeOfDish without a mockDish
fileprivate let mockTypeOfDishWithoutADish = TypeOfDish(
    name: "Main Course",
    dishs: []
)

