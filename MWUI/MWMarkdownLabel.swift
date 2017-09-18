//
//  MWMarkdownLabel.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 9/17/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
open class MWMarkdownLabel: UILabel, MWMarkdownProtocol {

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
   // MARK:
   override open var text: String? {
      didSet {
         let attributedText = self.getMarkdown()
         self.text = ""
         self.attributedText = attributedText
      }
   }

}
