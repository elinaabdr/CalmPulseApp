//
//  CalmButtonView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

struct CalmButtonView: View {
    @Binding var isCalmButtonShown: Bool
    
    var body: some View {
        CalmButton(imageName: "ButtonCalm", title: "Calm")
            .padding()
            .onTapGesture {
                self.isCalmButtonShown.toggle()
            }
    }
}
