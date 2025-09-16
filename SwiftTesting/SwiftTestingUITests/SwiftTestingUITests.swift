//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by ÖMER  on 16.09.2025.
//

import XCTest

final class SwiftTestingUITests: XCTestCase {

    

    @MainActor
    func testToDoItem() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["To Do List"].buttons["Add"]
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
        let okButton = elementsQuery.buttons["OK"]

        let addedCell = app.tables.cells.containing(.staticText, identifier: "test").element
        
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("test")
        okButton.tap()
        XCTAssertTrue(addedCell.exists)
        
        
    }
    
    @MainActor
    func testDeleteItem(){
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["To Do List"].buttons["Add"]
        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
        let okButton = elementsQuery.buttons["OK"]

        let addedCell = app.tables.cells.containing(.staticText, identifier: "test").element
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
        addButton.tap()
        textField.tap()
        textField.typeText("test")
        okButton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
        
        
        
        
    }

    
}
