//
//  AddSugarViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit
import SwiftUI

class AddSugarViewController: UIViewController {

    var sugarOrigin: String
    
    init(sugarOrigin: String) {
        self.sugarOrigin = sugarOrigin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add \(sugarOrigin)"
        
        let hostingController = UIHostingController(rootView: AddSugarView(userHealthViewModel: UserHealthViewModel.shared, addSugarViewController: self, scene: SugarContainerScene(1, nodeType: sugarOrigin)))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }

    func navigateBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
