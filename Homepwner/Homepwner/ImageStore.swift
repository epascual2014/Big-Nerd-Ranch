//
//  ImageStore.swift
//  Homepwner
//
//  Created by Edrick Pascual on 4/4/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

// Fetch and cache the images as needed, but also able to flush cache if device runs low on memory
import Foundation
import UIKit

class ImageStore {
    
    let cache = NSCache()
    
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key)
        
        // Create full URL for Image
        let imageURL = imageURLForKey(key)
        
//        // Turn image into a PNG data
//        if let data = UIImagePNGRepresentation(image, 0.5)
        
        // Turn image into a JPEG data
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            
            // Write it to the full URL
            data.writeToURL(imageURL, atomically: true)
        }
    }
    
    // Imagestore will load the image from the filesystem if it doesnt already have it
    func imageForKey(key: String) -> UIImage? {
        return cache.objectForKey(key) as? UIImage
        
        if let existingImage = cache.objectForKey(key) as? UIImage {
            return existingImage
            
        }
        
        let imageURL = imageURLForKey(key)
        // MARK: Conditional statement - if initialization fails, else block is executed or guard statement is executed
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
        
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
        
        let imageURL = imageURLForKey(key)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
            
        } catch {
            print("Error removing the image from the disk: \(error)")
            
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
            
        }
        
    }
    
    
    // This function will have the abilit to save the image and save in the directory even if the app is on suspend state
    func imageURLForKey(key: String) -> NSURL {
        
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent(key)
        
    }
    
    
}
