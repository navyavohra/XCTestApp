//
//  XCTestAppUITests.swift
//  XCTestAppUITests
//
//  Created by Navya Vohra on 2025-03-02.
//
import XCTest

class XCTestAppUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testLoginFlow() {
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        XCTAssertTrue(usernameField.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertTrue(loginButton.exists)
        
        usernameField.tap()
        usernameField.typeText("TestUser")
        
        passwordField.tap()
        passwordField.typeText("Password123")
        
        loginButton.tap()
        
        XCTAssertTrue(app.navigationBars["Home"].exists)
    }
    
    func testNavigationToDetailScreen() {
        let firstItem = app.staticTexts["Item 1"]
        XCTAssertTrue(firstItem.exists)
        firstItem.tap()
        
        XCTAssertTrue(app.staticTexts["Details of Item 1"].exists)
    }
}
