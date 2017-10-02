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
   
   @IBOutlet weak var stackView: UIStackView!
   @IBOutlet weak var leftImageView: UIImageView!
   @IBOutlet weak var rightImageView: UIImageView!
   
   fileprivate var view: UIView!
   fileprivate let nibName: String = "MWNotificationLabel"
   
   
   override public init(frame: CGRect) {
      super.init(frame: frame)
      initialization()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      initialization()
   }
   
   fileprivate func initialization() {
      view = loadViewFromNib()
      
      view.frame = bounds
      view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
      
      let bundle = Bundle(for: type(of: self) as AnyClass)
      let image = UIImage(named: "success", in: bundle, compatibleWith: nil)
      self.leftImageView.image = image
      
      addSubview(view)
   }
   
   fileprivate func loadViewFromNib() -> UIView? {
      let bundle = Bundle(for: type(of: self))
      
      if let view = bundle.loadNibNamed(self.nibName, owner: self, options: nil)?.first as? UIView {
         return view
      } else {
         return nil
      }
   }
}
