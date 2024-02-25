//
//  PulseView.swift
//  CalmPulseApp Watch App
//
//  Created by Элина Абдрахманова on 25.02.2024.
//

import SwiftUI

struct PulseView: View {
    @Binding var isCalmButtonShown: Bool
    
    var body: some View {
        HStack {
            Text("60")
                .font(.system(size: 56))
                .onTapGesture {
                    self.isCalmButtonShown.toggle()
                }
            
            VStack(alignment: .leading) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("BPM")
                    .font(.system(size: 14))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
