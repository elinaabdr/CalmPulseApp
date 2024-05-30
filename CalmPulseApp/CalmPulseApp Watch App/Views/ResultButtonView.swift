import SwiftUI

struct ResultButtonView: View {
    @Binding var isResultShown: Bool
    var pulseData: PulseData
    
    var body: some View {
        Button() {
            if let pulseData = pulseData.exerciseDate {
                Text(pulseData)
                    .padding()
            }
            isResultShown.toggle()
        }
    }
}
