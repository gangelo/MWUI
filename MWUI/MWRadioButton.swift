//
//  MWRadioButton.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 11/10/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
open class MWRadioButton: UIView {
   //
   // MARK: Properties
   
   @IBOutlet public weak var radioButton: MWRadioButtonButton!
   @IBOutlet public weak var radioButtonLabel: UILabel!
    
    fileprivate var view: UIView!
    open let nibName: String = "MWRadioButton"
   
   //
   // MARK: Initialization
  
   override public init(frame: CGRect) {
      super.init(frame: frame)
      self.initialization()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      self.initialization()
   }
   
   override open func awakeFromNib() {
      super.awakeFromNib()
   }
   
   open func initialization() {
      view = self.loadViewFromNib()
      
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
   
   open var text:String? = "" {
      didSet { self.radioButtonLabel.text = self.text }
   }
   
   open var isSelected:Bool = false {
      didSet { self.radioButton.isSelected = self.isSelected }
   }
   
   override open func sizeToFit() {
      super.sizeToFit()
      
      self.radioButtonLabel.sizeToFit()
   }

}
