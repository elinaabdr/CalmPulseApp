import Foundation
import HealthKit
import Combine

class HealthKitManager: ObservableObject {
    
    private var healthStore = HKHealthStore()
    private var heartRateQuery: HKQuery?
    @Published var heartRate: Double = 0.0

    init() {
        requestAuthorization()
    }

    private func requestAuthorization() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let typesToShare: Set<HKSampleType> = []
        let typesToRead: Set<HKObjectType> = [heartRateType]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if success {
                self.startHeartRateQuery()
            } else {
                print("Authorization failed with error: \(String(describing: error))")
            }
        }
    }

    private func startHeartRateQuery() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let query = HKObserverQuery(sampleType: heartRateType, predicate: nil) { (query, completionHandler, error) in
            if error == nil {
                self.fetchLatestHeartRate()
            }
            completionHandler()
        }
        healthStore.execute(query)
    }

    private func fetchLatestHeartRate() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            if let sample = samples?.first as? HKQuantitySample {
                let heartRateUnit = HKUnit(from: "count/min")
                let heartRateValue = sample.quantity.doubleValue(for: heartRateUnit)
                DispatchQueue.main.async {
                    self.heartRate = heartRateValue
                }
            }
        }
        healthStore.execute(query)
    }
}
