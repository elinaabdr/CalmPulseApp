//
//  ResultViews.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 29.05.2024.
//

import SwiftUI

struct ResultView: View {
    var pulseData: PulseData
    
    var body: some View {
        VStack {
            Text("Выше нормы")
                .font(.title)
                .padding()
            
            Text("Пульс: \(pulseData.heartRate)")
                .padding()
            
            Text("Дата: \(formattedDate)")
                .padding()
            
            Spacer()
        }
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: pulseData.date)
    }
}
