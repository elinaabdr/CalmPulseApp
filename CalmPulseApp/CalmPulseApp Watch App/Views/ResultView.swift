import SwiftUI

struct ResultView: View {
    var pulseData: PulseData
    
    var body: some View {
        VStack {
            if let pulseRecords = pulseData.pulseMax {
                Text("Максимальное пульсовое давление: \(pulseRecords)")
                    .padding()
            }
            
            if let startDate = pulseData.exerciseStartTime {
                Text("Начало упражнения: \(startDate, formatter: dateFormatter)")
                    .padding()
            }
            
            if let endDate = pulseData.exerciseEndTime {
                Text("Конец упражнения: \(endDate, formatter: dateFormatter)")
                    .padding()
            }
            
            if let exerciseDate = pulseData.exerciseDate {
                Text("Дата упражнения: \(exerciseDate, formatter: dateFormatter)")
                    .padding()
            }
            
            Spacer()
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

