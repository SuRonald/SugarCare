//
//  OnBoardingViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit
import SwiftUI

class OnBoardingViewController: UIViewController {
    
    let userHealthViewModel = UserHealthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingController = UIHostingController(rootView: OnBoardingView(userHealthViewModel: userHealthViewModel, onBoardingViewController: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }

    func navigateToEditor() {
        let destination = DataEditorViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
