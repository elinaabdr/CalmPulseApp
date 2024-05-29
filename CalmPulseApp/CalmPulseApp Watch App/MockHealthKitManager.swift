//
//  MockHealthKitManager.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import Foundation

class MockHealthKitManager: ObservableObject {
    weak var delegate: PulseChangeDelegate?
    private var timer: Timer?
    @Published var heartRate: Double = 0.0
    
    init() {
        startHeartRateQuery()
    }
    
    func stopGeneratingPulse() {
        timer?.invalidate()
    }
    
    private func startHeartRateQuery() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            var randomPulse = Double.random(in: 60...110)
            if CommandLine.isUITesting {
                randomPulse = 120
            }
            self?.delegate?.didChangePulse(to: Int(randomPulse))
            self?.heartRate = randomPulse
        }
        timer?.fire()
    }
}


extension CommandLine {
    static var isUITesting: Bool {
        return ProcessInfo.processInfo.arguments.contains("UITEST")
    }
}
