//
//  CalmhHintsView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import SwiftUI

extension String {
    static var firstHint: String {
        "Вдыхайте через нос глубоко, наполняя легкие"
    }
    static var secondHint: String {
        "Задержите дыхание, сосредоточьтесь"
    }
    static var thirdHint: String {
        "Медленно выдыхайте, освобождая легкие"
    }
    static var fourthHint: String {
        "Повторяйте цикл. Сосредоточьтесь на дыхании"
    }
}

struct CalmHintsView: View {
    @State private var hintIndex = 0
    @State private var showButtons = false
    @Environment(\.presentationMode) var presentationMode
    
    let hints = [String.firstHint, String.secondHint, String.thirdHint, String.fourthHint]
    
    var body: some View {
        VStack {
            if !showButtons {
                Text("\(hints[hintIndex])\n...")
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                            withAnimation {
                                hintIndex = (hintIndex + 1) % hints.count
                                if hintIndex == 0 {
                                    showButtons = true
                                    timer.invalidate()
                                }
                            }
                        }
                    }
            }
            
            if showButtons {
                VStack(spacing: 20) {
                    Button(action: {
                        hintIndex = 0
                        showButtons = false
                    }) {
                        Text("Повторить")
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Завершить")
                            .padding()
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
        }
    }
}
