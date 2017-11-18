//
//  MWLinkButton.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 9/14/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
open class MWLinkButton: UIButton {

   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.initialize()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      
      self.initialize()
   }
   
   func initialize() {
      
      let attributes:[String: Any] = [
         NSUnderlineStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue
      ]
      
      if let buttonTitle = self.title(for: .normal) {
         let attributeString = NSMutableAttributedString(string: buttonTitle, attributes: attributes)
         self.setAttributedTitle(attributeString, for: .normal)
      }
   }

}
