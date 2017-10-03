//
//  MWNotificationLabel.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 10/1/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
open class MWNotificationLabel: UIView {
   
   //
   // MARK: Properties
   
   @IBOutlet public weak var stackView: UIStackView!
   @IBOutlet public weak var leftImageView: UIImageView!
   @IBOutlet public weak var rightImageView: UIImageView!
   @IBOutlet public weak var notificationLabel: UILabel!
   
   fileprivate var view: UIView!
   open let nibName: String = "MWNotificationLabel"
   
   
   override public init(frame: CGRect) {
      super.init(frame: frame)
      initialization()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      initialization()
   }
   
   open func initialization() {
      view = loadViewFromNib()
      
      view.frame = bounds
      view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
      
      addSubview(view)
   }
   
   open func loadViewFromNib() -> UIView? {
      let bundle = Bundle(for: type(of: self))
      
      if let view = bundle.loadNibNamed(self.nibName, owner: self, options: nil)?.first as? UIView {
         return view
      } else {
         return nil
      }
   }
}
