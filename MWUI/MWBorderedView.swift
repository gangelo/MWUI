//
//  MWBorderedView.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 10/9/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import Foundation

@IBDesignable
class MWBorderedView: UIView {
   override public init(frame: CGRect) {
      super.init(frame: frame)
      initialization()
   }

   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      initialization()
   }

   open func initialization() {
   }
   
   @IBInspectable open var borderColor: UIColor = UIColor.clear {
      didSet {
         self.setNeedsDisplay()
      }
   }
   
   @IBInspectable open var borderWidth: CGFloat = 0 {
      didSet {
         self.setNeedsDisplay()
      }
   }
   
   @IBInspectable open var borderInset: CGFloat = 0 {
      didSet {
         self.setNeedsDisplay()
      }
   }
   
   override open func draw(_ rect: CGRect) {
      super.draw(rect)
      
      let startingPoint = CGPoint(x: rect.minX + self.borderInset, y: rect.maxY)
      let endingPoint = CGPoint(x: rect.maxX - self.borderInset, y: rect.maxY)
      let path = UIBezierPath()
      
      path.move(to: startingPoint)
      path.addLine(to: endingPoint)
      path.lineWidth = self.borderWidth
      
      let color:UIColor = self.borderColor
      color.setStroke()
      
      path.stroke()
   }
   
}
