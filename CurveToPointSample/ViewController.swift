//
//  ViewController.swift
//  CurveToPointSample
//
//  Created by Kuze Masanori on 2015/07/05.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import UIKit

enum Point{
    case startPoint
    case controlPoint1
    case controlPoint2
    case endPoint
    case none
}

class ViewController: UIViewController {
    
    var startPoint : UIView!
    
    var controlPoint1 : UIView!
    
    var controlPoint2 : UIView!
    
    var endPoint : UIView!
    
    var tapPoint : Point = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startPoint = UIView(frame: CGRectMake(10, 30, 20, 20))
        startPoint.backgroundColor = UIColor.blackColor()
        startPoint.userInteractionEnabled = true
        startPoint.tag = 1
        
        self.view.addSubview(startPoint)
        
        
        controlPoint1 = UIView(frame: CGRectMake(200, 100, 20, 20))
        controlPoint1.backgroundColor = UIColor.redColor()
        controlPoint1.userInteractionEnabled = true
        controlPoint1.tag = 2
        
        self.view.addSubview(controlPoint1)
        
        
        controlPoint2 = UIView(frame: CGRectMake(50, 200, 20, 20))
        controlPoint2.backgroundColor = UIColor.blueColor()
        controlPoint2.userInteractionEnabled = true
        controlPoint2.tag = 3
        
        self.view.addSubview(controlPoint2)
        
        
        endPoint = UIView(frame: CGRectMake(300, 300, 20, 20))
        endPoint.backgroundColor = UIColor.blackColor()
        endPoint.userInteractionEnabled = true
        endPoint.tag = 4
        
        self.view.addSubview(endPoint)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        
        let touche : UITouch = touches.first as! UITouch
        
        switch (touche.view.tag as Int) {
        case 1 :
            tapPoint = .startPoint
        case 2 :
            tapPoint = .controlPoint1
        case 3 :
            tapPoint = .controlPoint2
        case 4 :
            tapPoint = .endPoint
        default:
            tapPoint = .none
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesMoved(touches, withEvent: event)
        
        let touche : UITouch = touches.first as! UITouch
        
        let location = touche.locationInView(self.view)
        let x = String(format: "%.2f", location.x)
        let y = String(format: "%.2f", location.y)
        
        let point : Point = tapPoint
        
        let view = self.view as! CurveToPointSampleView
        
        switch(point){
        case .startPoint :
            view.lblx0.text = x
            view.lbly0.text = y
            let subView = self.view.viewWithTag(1)
            subView!.frame.origin.x = location.x
            subView!.frame.origin.y = location.y
        case .controlPoint1 :
            view.lblcp1x.text = x
            view.lblcp1y.text = y
            let subView = self.view.viewWithTag(2)
            subView!.frame.origin.x = location.x
            subView!.frame.origin.y = location.y
        case .controlPoint2 :
            view.lblcp2x.text = x
            view.lblcp2y.text = y
            let subView = self.view.viewWithTag(3)
            subView!.frame.origin.x = location.x
            subView!.frame.origin.y = location.y
        case .endPoint :
            view.lblx.text = x
            view.lbly.text = y
            let subView = self.view.viewWithTag(4)
            subView!.frame.origin.x = location.x
            subView!.frame.origin.y = location.y
        default :
            break
        }
        
        view.setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        
        tapPoint = .none
    }
    
}

