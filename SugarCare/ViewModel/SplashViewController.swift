//
//  SplashViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit

class SplashViewController: UIViewController {

    let splashViewModel = SplashViewModel()
    var splashBackground = UIImageView(image: UIImage(named: "SplashScreen"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splashBackground.frame = view.frame
        view.addSubview(splashBackground)
        
        splashViewModel.checkFirstTime()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !self.splashViewModel.initialOpen! {
                print("Belom Pernah")
                self.navigationController?.setViewControllers([OnBoardingViewController()], animated: true)
            }
            else {
                print("Udah Pernah")
                UserHealthViewModel.shared.getUserData()
                UserHealthViewModel.shared.getSugarData()
                self.navigationController?.setViewControllers([MainViewController()], animated: true)
            }
        }
    }
    
}
