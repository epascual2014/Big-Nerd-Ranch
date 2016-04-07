//
//  DetailedViewController.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/29/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class DetailedViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: Adding Pictures
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        
        
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture; otherwise pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            imagePicker.sourceType = .Camera
            
        } else {
         
            imagePicker.sourceType = .PhotoLibrary
            
        }
        
        imagePicker.delegate = self
        
        // Place image picker on the screen
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // MARK: Clear Picture
    // Create button func to delete image.
    // Try to figured out constraint
    
    @IBAction func clearImage(sender: AnyObject) {
        
        
        removeFromParentViewController()
        
        print("delete")
        
    }
    
    // MARK: ImagepickerController
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // Get selected image from info dictionary
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Store the image in the ImageStore for the items key
        imageStore.setImage(image, forKey: item.itemKey)
       
        
        // Put that image on to the screen in the image view
        imageView.image = image
        
        // Take image picker off the screen -  call this in order to dismiss method
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: outlets
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var serialNumberField: UITextField!
    
    @IBOutlet var valueField: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backGroundTapped(sender: AnyObject) {
        
        view.endEditing(true)
    }
        
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
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateLabel.text = dateFormatter.stringFromDate(item.dateCreated)
        
        // Get item key
        let key = item.itemKey
        
        // If there is an assoc image w/ item display it on the image view
        let imageToDisplay = imageStore.imageForKey(key)
        imageView.image = imageToDisplay
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
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

    // MARK: Updates Title of the current Navigation Window 
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // PROPERTY OBSERVER - updates the title of the NavigationItem when user clicks to see the detail of the item
    
    var item: Item! {
        didSet {
            
            navigationItem.title = item.name
        }
    }
    
    // Adding dependency from ImageStore.
    var imageStore: ImageStore!
}