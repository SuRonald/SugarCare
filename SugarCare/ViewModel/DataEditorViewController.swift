//
//  DataEditorViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit
import SwiftUI

class DataEditorViewController: UIViewController {
    
    let splashViewModel = SplashViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "User Data Editor"
        
        view.backgroundColor = .white
        
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelHandler)), animated: true)
        
        let hostingController = UIHostingController(rootView: DataEditorPage(dataEditorViewController: self, weight: 50, height: 70, year: 1990, activityMult: 1))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }
    

    @objc func cancelHandler() {
        navigationController?.popViewController(animated: true)
    }
    
    func saveHandler(weight: Float, height: Float, year: Int, genderMult: Int, activityMult: Float) {
        splashViewModel.checkFirstTime()
        if !splashViewModel.initialOpen! {
            splashViewModel.setInitialOpen()
        }
        
        UserHealthViewModel.shared.setUserData(weight: weight, height: height, year: year, genderMult: genderMult, activityMult: activityMult)
        navigateToMain()
        
    }
    
    func navigateToMain() {
        let destination = MainViewController()
        navigationController?.setViewControllers([destination], animated: true)
    }

}
