//
//  UserHealthViewModel.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 24/05/23.
//

import Foundation
import HealthKit

class UserHealthViewModel {
    
    static let shared = UserHealthViewModel()
    
    let healthStore = HKHealthStore()
    var sugarGrams: Int = 0
    
    var weight: Float = 0
    var height: Float = 0
    var year: Int = 0
    var genderMult: Int = 0
    var activityMult: Int = 0
    var limitSugarGrams: Int = 0
    var recomendSugar: Float = 0
    
    func getUserData() {
        weight = UserDefaults.standard.float(forKey: "weight")
        height = UserDefaults.standard.float(forKey: "height")
        year = UserDefaults.standard.integer(forKey: "year")
        activityMult = UserDefaults.standard.integer(forKey: "activityMult")
        limitSugarGrams = UserDefaults.standard.integer(forKey: "limitSugarGrams")
        genderMult = UserDefaults.standard.integer(forKey: "genderMult")
        if genderMult == 5 {
            recomendSugar = 37.5
        }
        else if genderMult == -161 {
            recomendSugar = 25
        }
    }
    
    func setUserData(weight: Float, height: Float, year: Int, genderMult: Int, activityMult: Float) {
        UserDefaults.standard.set(weight, forKey: "weight")
        UserDefaults.standard.set(height, forKey: "height")
        UserDefaults.standard.set(year, forKey: "year")
        UserDefaults.standard.set(genderMult, forKey: "genderMult")
        UserDefaults.standard.set(activityMult, forKey: "activityMult")
        
        let newSugarLimit = calculateSugarLimit(weight: weight, height: height, year: year, genderMult: genderMult, activityMult: activityMult)
        UserDefaults.standard.set(newSugarLimit, forKey: "limitSugarGrams")
    }
    
    func calculateSugarLimit(weight: Float, height: Float, year: Int, genderMult: Int, activityMult: Float) -> Int {
        let age = Calendar.current.component(.year, from: Date()) - year
        let resultWH = (10 * weight) + (6.25 * height)
        let resultAG = (5 * age) + genderMult
        let totalCalories = (resultWH - Float(resultAG)) * activityMult
        return Int(totalCalories * 0.1)
    }
    
    func healthStoreHandler() {
        if HKHealthStore.isHealthDataAvailable() {
            let infoToRead = Set([
//                HKQuantityType(.height),
//                HKQuantityType(.bodyMass),
                HKQuantityType(.dietarySugar)
//                HKCharacteristicType(.dateOfBirth)
            ])
            
            let infoToWrite = Set([
//                HKQuantityType(.height),
//                HKQuantityType(.bodyMass),
                HKQuantityType(.dietarySugar)
            ])
            
            healthStore.requestAuthorization(toShare: infoToWrite, read: infoToRead) { success, error in
                if !success {
                    print(error!)
                }
            }
        }
    }
    
    func getSugarData(completion: @escaping () -> ()) {
        self.sugarGrams = 0
        
        guard let sugarSampleType = HKSampleType.quantityType(forIdentifier: .dietarySugar) else {
            return
        }
        getMostRecentSample(for: sugarSampleType) { samples, error in
            guard let newData = samples else {
                if error == nil {
                    return
                }
                print(error!)
                return
            }
            
            if !samples!.isEmpty {
                for i in 0..<newData.count {
                    self.sugarGrams += Int(newData[i].quantity.doubleValue(for: HKUnit.gram()))
                }
            }
            
            completion()
        }
    }
    
    func getMostRecentSample(for sampleType: HKSampleType, completion: @escaping ([HKQuantitySample]?, Error?) -> ()) {
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date().dayBefore, end: Date(), options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let limit = 200
        let sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: mostRecentPredicate, limit: limit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            
            DispatchQueue.main.async {
                guard let results = samples else {
                    completion(nil, error)
                    return
                }
                
                let todayDate = Calendar.current.component(.day, from: Date())
                var mostRecentSample: [HKQuantitySample] = []
                
                for i in 0..<results.count {
                    let newSample = results[i] as? HKQuantitySample
                    let sampleDate = Calendar.current.component(.day, from: newSample!.startDate)
                    
                    if todayDate == sampleDate {
                        mostRecentSample.append(newSample!)
                    }
                }
                completion(mostRecentSample, nil)
            }
        }
         
        HKHealthStore().execute(sampleQuery)
    }
    
    func saveSugarSample(dietarySugar: Double) {
        guard let dietarySugarType = HKQuantityType.quantityType(forIdentifier: .dietarySugar) else {
            return
        }
        let sugarQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: dietarySugar)
        let dietarySugarSample = HKQuantitySample(type: dietarySugarType, quantity: sugarQuantity, start: Date(), end: Date())
        
        HKHealthStore().save(dietarySugarSample) { (success, error) in
            if !success {
                print(error!)
            }
        }
    }
}
