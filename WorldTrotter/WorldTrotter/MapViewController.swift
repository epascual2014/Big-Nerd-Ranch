//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Edrick Pascual on 2/29/16.
//  Copyright © 2016 Edrick Pascual. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        
        //MapView Created
        mapView = MKMapView()
        
        //Set the view to the view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
            segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedControl)
        
        let topContstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)

        topContstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    
    }
    
    
    
    //var currentTime: NSTimeZone
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MVC loaded")
        
    }
    
    
}
