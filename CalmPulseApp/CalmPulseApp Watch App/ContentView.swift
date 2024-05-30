//
//  ContentView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isCalmButtonShown = false
    @State private var isResultButtonShown = false
    @State private var showCalmHints = false
    @State private var showResultView = false
    @State private var pulseData: PulseData? = nil
    @State private var startTime: Date?
    @State private var endTime: Date?
    
    var body: some View {
        VStack(alignment: .center, spacing: isCalmButtonShown ? 0 : 30) {
            Spacer()
            if isCalmButtonShown {
                CalmButtonView(isCalmButtonShown: $isCalmButtonShown)
                    .onDisappear {
                        endTime = Date()
                        if let startTime = startTime {
                            pulseData = PulseData(pulseMax: Int(healthKitManager.heartRate), exerciseStartTime: startTime, exerciseEndTime: endTime!, exerciseDate: Date())
                            showResultView = true
                        }
                    }
                    .onAppear {
                        startTime = Date()
                    }
            } else {
                if showResultView, let pulseData = pulseData {
                    ResultView(pulseData: pulseData)
                } else {
                    ResultButtonView(isResultShown: $showResultView)
                }
            }
            
            PulseView(isCalmButtonShown: $isCalmButtonShown)
        }
        .padding()
        .sheet(isPresented: $showCalmHints) {
            CalmHintsView()
        }
    }
}
