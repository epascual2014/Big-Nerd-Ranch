//
//  ItemStore.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/21/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
 
    
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        // Added new items in the array
        allItems.append(newItem)
        
        return newItem
        
    }
    
    func removeItem(item: Item) {
        
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
            
        }
        
    }
    
    
}
