//
//  CalmPulseApp_Watch_AppUnitTests.swift
//  CalmPulseApp Watch AppUnitTests
//
//  Created by Elina Abdrakhmanova on 30.05.2024.
//

import XCTest
import SwiftUI
@testable import CalmPulseApp_Watch_App

final class PulseDataTests: XCTestCase {
    
    func testPulseDataInitialization() {
        let date = Date()
        let pulseData = PulseData(pulseMax: 120, exerciseStartTime: date, exerciseEndTime: date, exerciseDate: date)
        
        XCTAssertEqual(pulseData.pulseMax, 120)
        XCTAssertEqual(pulseData.exerciseStartTime, date)
        XCTAssertEqual(pulseData.exerciseEndTime, date)
        XCTAssertEqual(pulseData.exerciseDate, date)
    }
}

final class ResultViewTests: XCTestCase {
    
    func testResultViewDisplay() {
        let date = Date()
        let pulseData = PulseData(pulseMax: 120, exerciseStartTime: date, exerciseEndTime: date, exerciseDate: date)
        let resultView = ResultView(pulseData: pulseData)
        
        let view = UIHostingController(rootView: resultView)
        
        XCTAssertTrue(view.view.debugDescription.contains("Максимальное пульсовое давление: 120"))
        XCTAssertTrue(view.view.debugDescription.contains("Начало упражнения:"))
        XCTAssertTrue(view.view.debugDescription.contains("Конец упражнения:"))
        XCTAssertTrue(view.view.debugDescription.contains("Дата упражнения:"))
    }
}
