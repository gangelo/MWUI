//
//  MWRadioButton.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 11/10/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
class MWRadioButton: UIView {
   //
   // MARK: Properties
   
   @IBOutlet weak var radioButton: MWRadioButtonButton!
   @IBOutlet weak var radioButtonLabel: UILabel!
   
   //
   // MARK: Initialization
   
   override func awakeFromNib() {
   }
   
   override public init(frame: CGRect) {
      super.init(frame: frame)
      initialization()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      initialization()
   }
   
   open func initialization() {
      guard let view = self.loadViewFromNib() else {
         fatalError("Error loading xib \(self.nibName)")
      }
      
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
   
   private var nibName:String {
      get {
         return String(describing: type(of: self))
      }
   }
   
   override open func sizeToFit() {
      super.sizeToFit()
      
      //self.notificationLabel.sizeToFit()
      //self.stackView.sizeToFit()
   }

}
