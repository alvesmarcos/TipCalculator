//
//  ViewController.swift
//  TipCalculator
//
//  Created by Marcos Alves on 10/05/19.
//  Copyright © 2019 Marcos Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subTotalTextField.becomeFirstResponder()
        createToolbar()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var subTotalTextField: UITextField!
    
    // MARK: - Functions
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        // create bar button item
        let doneBtn = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dismissKeyboard))
       
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil)
        
        // add items to toolbar
        toolbar.setItems([flexibleSpace, doneBtn], animated: true)
        
        // add toolbar to keyboard
        subTotalTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        subTotalTextField.resignFirstResponder()
    }
}

