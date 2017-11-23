//
//  MWLabel.swift
//
//  Created by Gene M. Angelo  Jr. on 9/8/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//
import UIKit

@IBDesignable
open class MWLabel: UILabel {
   
   //
   // MARK: - Design time attributes
   
   @IBInspectable var paddingXLeft: CGFloat = 8.0
   @IBInspectable var paddingXRight: CGFloat = 0.0
   @IBInspectable var paddingYTop: CGFloat = 0.0
   @IBInspectable var paddingYBottom: CGFloat = 0.0

   //
   // MARK: - Constructors
   
   override public init(frame: CGRect) {
      super.init(frame: frame)
      self.initialize()
   }
   
   required public init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.initialize()
   }
   
   public init(frame: CGRect, textColor:UIColor, fontSize:CGFloat) {
      super.init(frame: frame)
      
      self.font = self.font.withSize(fontSize)
      self.textColor = textColor
      
      self.initialize()
   }
   
   //
   // MARK: - Initializers
   
   open func initialize() {
      self.numberOfLines = 1
      self.lineBreakMode = .byWordWrapping
   }
   
   //
   // MARK: - Image functions
   
   open func setWaiting() {
      self.clear()
   }
   
   open func setSuccess(message:String = "") {
      self.clear()
      self.text = message
   }
   
   open func setError(error:String = "") {
      self.clear()
      self.text = error
   }
   
   open func clear() {
      self.text = ""
   }
   
   //
   // MARK: - Overrides
   
   override open var text: String? {
      didSet {
         if text != nil {
            self.sizeToFit()
         }
         self.layoutIfNeeded()
      }
   }

   //
   // MARK: - Draw functions
   
   override open func drawText(in rect: CGRect) {
      let edgeInsets = UIEdgeInsets(top: self.paddingYTop, left: self.paddingXLeft, bottom: self.paddingYBottom, right: self.paddingXRight)
      super.drawText(in: UIEdgeInsetsInsetRect(rect, edgeInsets))
   }
   
   override open var intrinsicContentSize: CGSize {
      get {
         var contentSize = super.intrinsicContentSize
         contentSize.height += self.paddingYTop + self.paddingYBottom
         contentSize.width += self.paddingXLeft + self.paddingXRight
         return contentSize
      }
   }
   
}



