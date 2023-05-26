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
    var sugarContainer: SugarContainerScene?
    
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
        
        sugarContainer = SugarContainerScene(1, nodeType: sugarOrigin)
        let hostingController = UIHostingController(rootView: AddSugarView(userHealthViewModel: UserHealthViewModel.shared, addSugarViewController: self, scene: sugarContainer!))
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.sugarContainer?.setShakeState(true)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.sugarContainer?.setShakeState(false)
        }
    }
}
