//
//  SplashViewModel.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import Foundation

class SplashViewModel {
    var initialOpen: Bool? = nil
    
    func checkFirstTime() {
        initialOpen = UserDefaults.standard.bool(forKey: "initialOpen")
    }
    
    func setInitialOpen() {
        UserDefaults.standard.setValue(true, forKey: "initialOpen")
    }
}
