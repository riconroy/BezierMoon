//
//  ViewController.swift
//  BezierMoon
//
//  Created by rick conroy on 2015-02-05.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var myImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.darkGrayColor()
		
		// load an image
		let myImage = UIImage(named: "purple")
		myImageView = UIImageView(image: myImage!)
		
		// size and placement
		let imageFrame = CGRect(x: 0, y: 0, width: 250, height: 444)
		myImageView.frame = imageFrame
		myImageView.center = self.view.center
		
		// add the bezier path
		let myBezierPath = bezierCurveWithHalfMoonOnLeft(myImageView.frame)
		var shapelayer = CAShapeLayer()
		shapelayer.path = myBezierPath.CGPath
		myImageView.layer.mask = shapelayer
		
		// add
		self.view.addSubview(myImageView)
	}
	
	func bezierCurveWithHalfMoonOnLeft(rect: CGRect) -> UIBezierPath {
		let initialPoint = CGPoint(x: 0, y: 0)
		let curveStart = CGPoint(x: 0, y: (rect.size.height) * (0.2))
		let curveControl = CGPoint(x: (rect.size.width) * (0.4), y: (rect.size.height) * (0.5))
		let curveEnd = CGPoint(x: 0, y: (rect.size.height) * (0.8))
		let firstCorner = CGPoint(x: 0, y: rect.size.height)
		let secondCorner = CGPoint(x: rect.size.width, y: rect.size.height)
		let thirdCorner = CGPoint(x: rect.size.width, y: 0)
		
		// note that the path needs to be in the coord system of the image, not the window!
//		let initialPoint = CGPoint(x: rect.origin.x, y: rect.origin.y)
//		let curveStart = CGPoint(x: rect.origin.x, y: rect.origin.y + (rect.size.height) * (0.3))
//		let curveControl = CGPoint(x: rect.origin.x + (rect.size.width) * (0.2), y: rect.origin.y + (rect.size.height) * (0.5))
//		let curveEnd = CGPoint(x: rect.origin.x, y: rect.origin.y + (rect.size.height) * (0.7))
//		let firstCorner = CGPoint(x: rect.origin.x, y: rect.origin.y + rect.size.height)
//		let secondCorner = CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height)
//		let thirdCorner = CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y)
		
		var myBezier = UIBezierPath()
		myBezier.moveToPoint(initialPoint)
		myBezier.addLineToPoint(curveStart)
		myBezier.addQuadCurveToPoint(curveEnd, controlPoint: curveControl)
		myBezier.addLineToPoint(firstCorner)
		myBezier.addLineToPoint(secondCorner)
		myBezier.addLineToPoint(thirdCorner)
		
		myBezier.closePath()
		return myBezier
	}

}

