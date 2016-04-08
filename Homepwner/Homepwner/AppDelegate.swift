//
//  AppDelegate.swift
//  Homepwner
//
//  Created by Edrick Pascual on 3/21/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let itemStore = ItemStore()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        print(__FUNCTION__)
        
        // Override point for customization after application launch.
        
        // Create an ItemStore
        let itemStore = ItemStore()
        
        // Create an ImageStore
        let imageStore = ImageStore()
        
        
        // Get the ItemsViewController
        let navController = window!.rootViewController as! UINavigationController;
        let itemsController = navController.topViewController as! ItemsViewController
        
        // Access the ItemsViewController and set its itemStore and imageStore
        itemsController.itemStore = itemStore
        itemsController.imageStore = imageStore
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        print(__FUNCTION__)
    }

    func applicationDidEnterBackground(application: UIApplication) {
    
        print(__FUNCTION__)
        
        let success = itemStore.saveChanges()
        if (success) {
            
            print("Saved all of the Items")
        
        } else {
            
            print("Could not save any of the Items")
            
        }
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        print(__FUNCTION__)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        print(__FUNCTION__)
    }
        
    func applicationWillTerminate(application: UIApplication) {
        print(__FUNCTION__)
    }


}

