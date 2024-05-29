//
//  CalmPulseApp_Watch_AppUITests.swift
//  CalmPulseApp Watch AppUITests
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import XCTest
@testable import CalmPulseApp_Watch_App

final class CalmPulseApp_Watch_AppUITests: XCTestCase {
    var app = XCUIApplication()
    private lazy var calmButton = app.buttons["Calm"]

    override func setUp(){
        app.launchArguments.append("UITEST")
        app.launch()
    }

    func testCalmViewDisplaysWhenPulseIsHigh() throws {
        XCTAssertTrue(calmButton.exists)
        calmButton.tap()
    }
}
