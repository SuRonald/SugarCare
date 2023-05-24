//
//  UserHealthViewModel.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 24/05/23.
//

import Foundation
import HealthKit

class UserHealthViewModel {
    
    let healthStore = HKHealthStore()
//    var heightData: Double?
//    var weightData: Double?
//    var dobYearData: Int?
    var sugarGrams: Int = 1
    
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
        getGender()
        getSugarLimit()
    }
    
    func getGender() {
        genderMult = UserDefaults.standard.integer(forKey: "genderMult")
        
        if genderMult == 5 {
            recomendSugar = 37.5
        }
        else if genderMult == -161 {
            recomendSugar = 25
        }
    }
    
    func getSugarLimit() {
        limitSugarGrams = UserDefaults.standard.integer(forKey: "limitSugarGrams")
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
    
    func getSugarData() {

        do {
//            dobYearData = try healthStore.dateOfBirthComponents().year
        }
        catch {
            print("-----", error)
        }

    }
    
}
