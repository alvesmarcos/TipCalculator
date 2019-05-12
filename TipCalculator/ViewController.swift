//
//  ViewController.swift
//  TipCalculator
//
//  Created by Marcos Alves on 10/05/19.
//  Copyright © 2019 Marcos Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subTotalTextField.becomeFirstResponder()
        createToolbar()
        tipPercentSlider.isEnabled = false
    }
    
    // MARK: - Outlets
    @IBOutlet weak var subTotalTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    // MARK: - Properties
    let model = Model()
    
    // MARK: - Interactions
    @IBAction func dragSlider(_ sender: UISlider) {
        let tipPercentAsInt = Int(sender.value)
        tipPercentLabel.text = "Tip (\(tipPercentAsInt)%)"
        
        model.tipPercentFromSlider = tipPercentAsInt
        updateLabels()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        subTotalTextField.text = ""
        tipPercentSlider.isEnabled = false
    }
    
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
        tipPercentSlider.isEnabled = true
        
        if subTotalTextField.text!.count == 0 {
            subTotalTextField.text = "$0.00"
            model.subTotalFromTextField = "0.00"
            updateLabels()
        } else {
            model.subTotalFromTextField = subTotalTextField.text!
            model.tipPercentFromSlider = Int(tipPercentSlider.value)
            
            updateLabels()
        }
    }
    
    func updateLabels() {
        subTotalTextField.text = model.subTotalAsCurrency
        tipAmountLabel.text = model.tipAmountAsCurrency
        totalAmountLabel.text = model.totalAmountAsCurrency
    }
}
