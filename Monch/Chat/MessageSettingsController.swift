//
//  MessageSettingsController.swift
//  Monch
//
//  Created by Fendy Pierre on 6/4/18.
//  Copyright © 2018 ConchNCode. All rights reserved.
//

import UIKit

class MessageSettingsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationButtons()
        
    }
    fileprivate func setupNavigationButtons() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleNext))
    }
    
    @objc func handleNext() {
        print("Handling done, saving settings")
         dismiss(animated: true, completion: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
