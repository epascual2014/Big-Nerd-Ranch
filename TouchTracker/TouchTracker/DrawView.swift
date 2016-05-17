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
    
    
    var currentLine: Line?
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    // MARK: method for stroking the lines
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.Round
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
        
    }
    
    override func drawRect(rect: CGRect) {
        //Draw finished lines in black
        UIColor.blackColor().setStroke()
        finishedLineColor.setStroke()
        for line in finishedLines {
            strokeLine(line)
        }
        
        if let line = currentLine {
            // If there is a line currently being drawn, do it in red.
            UIColor.redColor().setStroke()
            strokeLine(line)
        }
        
        // Draw current lines in red
        UIColor.redColor().setStroke()
        currentLineColor.setStroke()
        for (_, line) in currentLines {
            strokeLine(line)
        }
        
    }
    
    // MARK: Turning touches into lines
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        
        // Get location of the touch in views coordinate system
        let location = touch.locationInView(self)
        currentLine = Line(begin: location, end: location)
        
        // Log statement
        print(__FUNCTION__)
        
        for touch in touches {
            let location = touch.locationInView(self)
            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
            
        }
        
        setNeedsDisplay()
    }
    
    // Updates the end of the currentline
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let location = touch.locationInView(self)
        
        currentLine?.end = location
        
        print(__FUNCTION__)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.locationInView(self)
            
        }
        
        setNeedsDisplay()
    }
    
    // Updates the end of the location of the currentline and adds it to the array.
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if var line = currentLine {
            let touch = touches.first!
            let location = touch.locationInView(self)
            line.end = location
            finishedLines.append(line)
        }
        
        currentLine = nil
        
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
    
    // Cancells the current line if OS is interrupted
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print(__FUNCTION__)
        currentLines.removeAll()
        setNeedsDisplay()
    }
}
