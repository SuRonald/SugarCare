//
//  AddSugarViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit

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

        // Do any additional setup after loading the view.
        self.title = "Add \(sugarOrigin)"
        
        view.backgroundColor = .white
    }

}
