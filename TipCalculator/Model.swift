//
//  Model.swift
//  TipCalculator
//
//  Created by Marcos Alves on 11/05/19.
//  Copyright © 2019 Marcos Alves. All rights reserved.
//

import Foundation

class Model {
    
    var subTotalFromTextField = "0.00"
    var tipPercentFromSlider = 15
    
    // MARK: - Decimal for calculation
    var subTotalAsDecimal: NSDecimalNumber {
        return NSDecimalNumber(string: subTotalFromTextField)
    }
    
    var tipPercent: NSDecimalNumber {
        return NSDecimalNumber(value: Double(tipPercentFromSlider)/100)
    }
    
    var tipAmount: NSDecimalNumber {
        return subTotalAsDecimal.multiplying(by: tipPercent)
    }
    
    var totalAmount: NSDecimalNumber {
        return subTotalAsDecimal.adding(tipAmount)
    }
    
    // MARK: - Convert to Currency
    let formatter = NumberFormatter()
    
    var subTotalAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: subTotalAsDecimal as NSNumber)!
    }
    
    var tipAmountAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: tipAmount as NSNumber)!
    }
    
    var totalAmountAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: totalAmount as NSNumber)!
    }
}
