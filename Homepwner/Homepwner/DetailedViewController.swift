//
//  DetailedViewController.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/29/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item!
        
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
        
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
    
        return formatter
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = "\(item.valueInDollars)"
        dateLabel.text = "\(item.dateCreated)"
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        if let valueText = valueField.text,
            value = numberFormatter.numberFromString(valueText) {
                item.valueInDollars = value.integerValue
                
        } else {
            item.valueInDollars = 0
            
        }
    }
    
}