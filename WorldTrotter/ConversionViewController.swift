//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Edrick Pascual on 2/24/16.
//  Copyright © 2016 Edrick Pascual. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField?
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

            
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                
                return false
                
            } else {
                
                return true
            }
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double? {
        
        didSet {
            
            updateCelsiusLabel()
            
        }
        
    }
    
    var celsiusValue: Double? {
        
        if let value = fahrenheitValue {
            
            return (value - 32) * (5/9)
            
        } else {
            
            return nil
            
        }
        
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            
            fahrenheitValue = value
            
        } else {
            
            fahrenheitValue = nil
            
        }
        
    }
    
    
    func updateCelsiusLabel() {
        
        if let value = celsiusValue {
            
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        
        } else {
        
            celsiusLabel.text = "answer"
            
        }
        
    }
    
    // Textfield Function
    
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        
        textField!.resignFirstResponder()
    }
    
    
    //Number Formatter
    
    let numberFormatter: NSNumberFormatter = {
        
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        
        
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController Loaded its view")
    }

    
}
