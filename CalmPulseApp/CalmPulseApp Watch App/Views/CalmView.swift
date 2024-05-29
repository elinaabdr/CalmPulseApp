//
//  CalmView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import SwiftUI

struct CalmView: View {
    @State private var isCalmHintsViewPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Примите удобное положение")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10.0)
            
            Button(action: {
                self.isCalmHintsViewPresented.toggle()
            }) {
                Text("Далее")
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isCalmHintsViewPresented) {
                CalmHintsView()
            }
        }
        .padding()
    }
}

