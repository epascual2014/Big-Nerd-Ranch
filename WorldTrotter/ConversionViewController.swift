//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Edrick Pascual on 2/24/16.
//  Copyright © 2016 Edrick Pascual. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        celsiusLabel.text = textField.text
        
    }
    
}
