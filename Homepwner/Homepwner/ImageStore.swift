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
        
    }
    
    func imageForKey(key: String) -> UIImage? {
        return cache.objectForKey(key) as? UIImage
        
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObjectForKey(key)
        
    }
    
}
