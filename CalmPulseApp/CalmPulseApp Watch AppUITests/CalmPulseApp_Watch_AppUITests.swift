//
//  CalmPulseApp_Watch_AppUITests.swift
//  CalmPulseApp Watch AppUITests
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import XCTest
@testable import CalmPulseApp_Watch_App

import XCTest

final class CalmPulseApp_Watch_AppUITests: XCTestCase {
    var app: XCUIApplication!

    // UI elements
    private lazy var calmButton = app.buttons["Calm"]
    private lazy var closeButton = app.buttons["Завершить"]
    private lazy var resultButton = app.buttons["20.04 20:12"]
    private lazy var resultView = app.staticTexts["Максимальное пульсовое давление"]
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("UITEST")
        app.launch()
    }

    func testCalmButtonDisplaysWhenPulseIsHigh() throws {
        XCTAssertTrue(calmButton.waitForExistence(timeout: 5), "The Calm button should be displayed when the pulse is high.")
    }

    func testCalmHintsAreShown() throws {
        calmButton.tap()
        XCTAssertTrue(closeButton.waitForExistence(timeout: 5), "The Calm hints should be displayed after tapping the Calm button.")
    }

    func testResultViewDisplayedAfterClosingCalmHints() throws {
        calmButton.tap()
        closeButton.tap()
        XCTAssertTrue(resultButton.waitForExistence(timeout: 5), "The result button should be displayed after closing the calm hints.")
    }

    func testDetailedResultViewDisplayed() throws {
        calmButton.tap()
        closeButton.tap()
        resultButton.tap()
        XCTAssertTrue(resultView.waitForExistence(timeout: 5), "The detailed result view should be displayed when the result button is tapped.")
    }
}

