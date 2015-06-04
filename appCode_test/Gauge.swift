//
//  Gauge.swift
//  SuperBody
//
//  Created by Petr Korolev on 02/06/15.
//  Copyright (c) 2015 Petr Korolev. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
public class Gauge: UIView {

    @IBInspectable var lineColor: UIColor = UIColor(red: (37.0 / 255.0), green: (252.0 / 255), blue: (244.0 / 255.0), alpha: 1.0)
    @IBInspectable var bgColor: UIColor = UIColor(red: (171.0 / 255.0), green: (250.0 / 255), blue: (81.0 / 255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0 / 255.0), green: (32.0 / 255), blue: (53.0 / 255.0), alpha: 1.0)
    @IBInspectable var bgAlpha: CGFloat = 1
    @IBInspectable public var scale: CGFloat = 0.6 {
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable var lineWidth: CGFloat = 10.0 {
        didSet {
            updateLayerProperties()
        }
    }

    var bgLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!

    override public func layoutSubviews() {

        super.layoutSubviews()

        if !(bgLayer != nil) {

            let rect = CGRectInset(bounds, lineWidth / 2.0, lineWidth / 2.0)
            let path = UIBezierPath(ovalInRect: rect)
            bgLayer = CAShapeLayer.getOval(lineWidth, path: path.CGPath, strokeStart: 0, strokeEnd: 1, strokeColor: bgColor.colorWithAlphaComponent(bgAlpha), fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
            layer.addSublayer(bgLayer)

        }
        bgLayer.frame = layer.bounds

        if !(ringLayer != nil) {
            let rect = CGRectInset(bounds, lineWidth / 2.0, lineWidth / 2.0)
            let path = UIBezierPath(ovalInRect: rect)
            ringLayer = CAShapeLayer.getOval(lineWidth, path: path.CGPath, strokeStart: 0, strokeEnd: 1, strokeColor: lineColor, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero, rotateAngle: -M_PI_2)
            layer.addSublayer(ringLayer)
        }
        ringLayer.frame = layer.bounds

        updateLayerProperties()
    }

    func updateLayerProperties() {
        if (ringLayer != nil) {
            ringLayer.strokeEnd = scale
        }
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        self.setBackgroundImage(bgImage, forState: UIControlState.Normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }


}
