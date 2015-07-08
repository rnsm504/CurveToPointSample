//
//  CurveToPointSampleView.swift
//  CurveToPointSample
//
//  Created by Kuze Masanori on 2015/07/08.
//  Copyright (c) 2015年 Kuze Masanori. All rights reserved.
//

import Foundation
import UIKit

class CurveToPointSampleView : UIView {
    
    @IBOutlet weak var lblx0: UILabel!
    
    @IBOutlet weak var lbly0: UILabel!
    
    @IBOutlet weak var lblcp1x: UILabel!
    
    @IBOutlet weak var lblcp1y: UILabel!
    
    @IBOutlet weak var lblcp2x: UILabel!
    
    @IBOutlet weak var lblcp2y: UILabel!
    
    @IBOutlet weak var lblx: UILabel!
    
    @IBOutlet weak var lbly: UILabel!
    
    
    override func drawRect(rect: CGRect) {
        
        let context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        var x0 = CGFloat(NSString(string: lblx0.text!).doubleValue)
        var y0 = CGFloat(NSString(string: lbly0.text!).doubleValue)
        var cp1x = CGFloat(NSString(string: lblcp1x.text!).doubleValue)
        var cp1y = CGFloat(NSString(string: lblcp1y.text!).doubleValue)
        var cp2x = CGFloat(NSString(string: lblcp2x.text!).doubleValue)
        var cp2y = CGFloat(NSString(string: lblcp2y.text!).doubleValue)
        var x = CGFloat(NSString(string: lblx.text!).doubleValue)
        var y = CGFloat(NSString(string: lbly.text!).doubleValue)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(x0, y0))
        path.addCurveToPoint(CGPointMake(x, y), controlPoint1: CGPointMake(cp1x, cp1y), controlPoint2: CGPointMake(cp2x, cp2y))
        
        path.stroke()
        
    }
    
    override func awakeFromNib() {
        lblx0.text = "10"
        lbly0.text = "30"
        lblcp1x.text = "200"
        lblcp1y.text = "100"
        lblcp2x.text = "50"
        lblcp2y.text = "200"
        lblx.text = "300"
        lbly.text = "300"
    }
}