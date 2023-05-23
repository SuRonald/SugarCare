//
//  DataEditorViewController.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import UIKit

class DataEditorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "User Data Editor"
        
        view.backgroundColor = .white
        
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelHandler)), animated: true)
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveHandler)), animated: true)
    }
    

    @objc func cancelHandler() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveHandler() {
        navigationController?.popViewController(animated: true)
    }

}
