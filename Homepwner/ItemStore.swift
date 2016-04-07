//
//  ItemStore.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/21/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore {
    
    // MARK: Constructing the URL File
    var allItems = [Item]()
    let itemArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
        
    }()
    
    init () {
        
        if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(itemArchiveURL.path!) as? [Item] {
            
            allItems += archivedItems
            
        }
        
    }
    
    // MARK: Item created
    func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        // Added new items in the array
        allItems.append(newItem)
        
        return newItem
        
    }
    
    
    // MARK: Item deleted
    func removeItem(item: Item) {
        
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
            
        }
        
    }
    
    
    // MARK: Item (cell) moved
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        
        if fromIndex == toIndex {
            return
            
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.removeAtIndex(fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, atIndex: toIndex)
        
    }
    
    
    // MARK: Archive root Object
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path!)
        
    }
    
    
}
