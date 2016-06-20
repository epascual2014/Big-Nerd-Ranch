//
//  PhotoStore.swift
//  Photrama
//
//  Created by Edrick Pascual on 6/18/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation


class PhotoStore {
    
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func fetchRecentPhotos() {
        
        let url = FlickrAPI.recentPhotosURL()
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) {
                    
                    print(jsonString)
                }
                
            }
            else if let requestError = error {
                print ("Error fetching recent photos: \(requestError)")
                
            } else {
                print ("Unexpected error with the request")
            }
            
        }
        
        task.resume()
    }
    
}

