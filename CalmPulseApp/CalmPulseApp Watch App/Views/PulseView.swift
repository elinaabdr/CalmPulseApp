//
//  PulseView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

protocol PulseChangeDelegate: AnyObject {
    func didChangePulse(to pulse: Int)
}

struct PulseView: View {
    @Binding var isCalmButtonShown: Bool
    @ObservedObject private var healthKitManager = MockHealthKitManager()
    @State private var showCalmView = false
    weak var delegate: PulseChangeDelegate?
    @State private var pulseData: PulseData? = nil
    
    var body: some View {
        VStack {
            HStack {
                if healthKitManager.heartRate > 0 {
                    Text("\(Int(healthKitManager.heartRate))")
                        .font(.system(size: 56))
                        .onTapGesture {
                            self.isCalmButtonShown.toggle()
                        }
                } else {
                    Text("No info")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                }
                
                VStack(alignment: .leading) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("BPM")
                        .font(.system(size: 14))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .sheet(isPresented: $showCalmView) {
            CalmButtonView(isCalmButtonShown: $isCalmButtonShown)
        }
        .onReceive(healthKitManager.$heartRate) { heartRate in
            if heartRate > 110 {
                self.isCalmButtonShown = true
            }
        }
    }
}

