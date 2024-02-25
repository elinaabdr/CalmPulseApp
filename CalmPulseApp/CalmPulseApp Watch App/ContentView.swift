//
//  ContentView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isCalmButtonShown = false
    
    var body: some View {
        VStack(alignment: .center, spacing: isCalmButtonShown ? 0 : 54) {
            Spacer()
            if isCalmButtonShown {
                CalmButtonView(isCalmButtonShown: $isCalmButtonShown)
            } else {
                InfoView()
            }
            
            PulseView(isCalmButtonShown: $isCalmButtonShown)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
