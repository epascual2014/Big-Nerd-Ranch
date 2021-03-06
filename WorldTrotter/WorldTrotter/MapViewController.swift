//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Edrick Pascual on 2/29/16.
//  Copyright © 2016 Edrick Pascual. All rights reserved.
//

import MapKit
import Foundation
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    var currentTime: NSTimeZone!
    
    override func loadView() {
        
        //MapView Created
        mapView = MKMapView()
        
        //Set the view to the view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        
        _ = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
            segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.addTarget(self,
                action: "mapTypeChanged:",
                forControlEvents: .ValueChanged)
        
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    
    
    }
    
    func  mapTypeChanged(segControl: UISegmentedControl) {
        
        switch segControl.selectedSegmentIndex {
            
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
            
        }
        
    }
    
    
    //var currentTime: NSTimeZone
    
    override func viewDidLoad() {
        super.viewDidLoad()
               print("MVC loaded")
        
    }
}
