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
    
    // MARK: Array of dictionary - tracks the lines being drawn which also have the ability to track one line at a time.
    var finishedLines = [Line]()
    
    // MARK: Stores lines in a value dictionary.
    var currentLines = [NSValue:Line]()
    

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
        
        // Draw current lines in red
        UIColor.redColor().setStroke()
        for (_,line) in currentLines {
            strokeLine(line)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        
        // Get locatin of the touch in views coordinate system
        let location = touch.locationInView(self)
        
        currentLine = Line(begin: location, end: location)
        
        // MARK: Log Statement
        print(__FUNCTION__)
        
        for touch in touches {
            let location = touch.locationInView(self)
            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
            
        }
        
        setNeedsDisplay()
    }
    
    // MARK: Updates the end of the currentline
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let location = touch.locationInView(self)
        
        currentLine?.end = location
        
        // MARK: Log Statement
        print(__FUNCTION__)
        
        for touch in touches {
            
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.locationInView(self)
        }
        
        
        
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
        
        // MARK: Log statement
        print(__FUNCTION__)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.locationInView(self)
                
                finishedLines.append(line)
                currentLines.removeValueForKey(key)
                
            }
            
        }
        
        setNeedsDisplay()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        // MARK: Log statement
        print (__FUNCTION__)
        
        currentLines.removeAll()
        setNeedsDisplay()
    }
}
