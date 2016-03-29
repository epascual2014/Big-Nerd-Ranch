//
//  ItemCell.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/28/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    func updateLabels() {
        
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        serialNumberLabel.font = caption1Font
        
//        
//        let textColor = Int(valueLabel.text!)
//        
//        if textColor <= Int(50) {
//            valueLabel.textColor = UIColor.greenColor()
//        
//        } else {
//        
//            valueLabel.textColor = UIColor.redColor()
//        }
//        
//        
    }
    
    
}
