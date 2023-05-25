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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sugar Care"
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(navigateToEditor)), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserHealthViewModel.shared.getSugarData {
            let hostingController = UIHostingController(rootView: MainView(userHealthViewModel: UserHealthViewModel.shared, mainViewController: self, scene: SugarContainerScene(UserHealthViewModel.shared.sugarGrams, nodeType: "Sugar")))
            self.addChild(hostingController)
            self.view.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            hostingController.view.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalTo(self.view)
            }
            hostingController.didMove(toParent: self)
        }
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

