//
//  ViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    
    let userHealthViewModel = UserHealthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sugar Care"
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(navigateToEditor)), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userHealthViewModel.getUserData()
//        print("Limit", userHealthViewModel.limitSugarGrams)
//        print("Recommended", userHealthViewModel.recomendSugar)
        
        let hostingController = UIHostingController(rootView: MainView(userHealthViewModel: userHealthViewModel, mainViewController: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }

    func navigateToSnack() {
        print("Masuk Snack")
        let destination = AddSugarViewController(sugarOrigin: "Snack")
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func navigateToDrink() {
        print("Masuk Drink")
        let destination = AddSugarViewController(sugarOrigin: "Drink")
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func navigateToEditor() {
        navigationController?.pushViewController(DataEditorViewController(), animated: true)
    }
}

