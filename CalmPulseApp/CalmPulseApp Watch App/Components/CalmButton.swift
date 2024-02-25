//
//  CalmButton.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

struct CalmButton: View {
    var imageName: String
    var title: String
    
    var body: some View {
        Button(action: {
            // Обработчик нажатия кнопки
        }) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(CalmButtonStyle())
    }
}
