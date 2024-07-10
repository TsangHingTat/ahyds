//
//  get_health_datas.swift
//  AI教你做運動
//
//  Created by HingTatTsang on 7/11/24.
//

import Foundation
import HealthKit

class HealthKitManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, nil)
            return
        }
        
        let typesToRead: Set<HKObjectType> = [
            HKObjectType.workoutType(),
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        ]
        
        let typesToShare: Set<HKSampleType> = [
            HKObjectType.workoutType(),
            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            completion(success, error)
        }
    }
    
    func fetchRunningSpeed(completion: @escaping (Double?, Error?) -> Void) {
        let workoutType = HKObjectType.workoutType()
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: workoutType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            if let workouts = samples as? [HKWorkout], let lastWorkout = workouts.first {
                if let distance = lastWorkout.totalDistance?.doubleValue(for: .meter()), lastWorkout.duration > 0 {
                    let speed = distance / lastWorkout.duration
                    completion(speed, nil)
                } else {
                    completion(nil, NSError(domain: "AppDomain", code: -1, userInfo: [NSLocalizedDescriptionKey: "未找到跑步數據或距離為零"]))
                }
            } else {
                completion(nil, error)
            }
        }
        
        healthStore.execute(query)
    }
    
    
    func generateTestData(completion: @escaping (Bool, Error?) -> Void) {
        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let workoutType = HKWorkoutActivityType.running
        let startDate = Date().addingTimeInterval(-3600) // 1 hour ago
        let endDate = Date()
        
        let distanceQuantity = HKQuantity(unit: HKUnit.meter(), doubleValue: 5000) // 5 km
        let duration = endDate.timeIntervalSince(startDate)
        
        let workout = HKWorkout(activityType: workoutType, start: startDate, end: endDate, duration: duration, totalEnergyBurned: nil, totalDistance: distanceQuantity, metadata: nil)
        
        healthStore.save(workout) { (success, error) in
            if success {
                let distanceSample = HKQuantitySample(type: distanceType, quantity: distanceQuantity, start: startDate, end: endDate)
                
                self.healthStore.add([distanceSample], to: workout) { (success, error) in
                    completion(success, error)
                }
            } else {
                completion(false, error)
            }
        }
    }
}
