//
//  DrawView.swift
//  TouchTracker
//
//  Created by Edrick Pascual on 4/11/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView  {

    // MARK: Optional Line - tracks the line currently drawn
    var currentLine: Line?
    
    // MARK: Array of Lines - tracks the lines being drawn
    var finishedLines = [Line]()

    func strokeLine(line: Line) {
        
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = CGLineCap.Round
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
        
        
    }
    
    
    override func drawRect(rect: CGRect) {
        
        // Draw finished lines in black
        UIColor.blackColor().setStroke()
        for line in finishedLines {
            strokeLine(line)
        }
        
        if let line = currentLine {
            
            // If there is a line currently being drawn, do it in red
            UIColor.redColor().setStroke()
            strokeLine(line)
            
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        
        // Get locatin of the touch in views coordinate system
        let location = touch.locationInView(self)
        
        currentLine = Line(begin: location, end: location)
        
        setNeedsDisplay()
    }
    
    // MARK: Updates the end of the currentline
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let location = touch.locationInView(self)
        
        currentLine?.end = location
        setNeedsDisplay()
    }
    
    // MARK: Update the end location of the currentline line and add it to the array
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if var line = currentLine {
            let touch = touches.first!
            let location = touch.locationInView(self)
            line.end = location
            
            // MARK: adds line in array
            finishedLines.append(line)
            
        }
        currentLine = nil
        
    }
    
}
