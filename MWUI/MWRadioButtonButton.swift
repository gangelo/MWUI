//
//  MWRadioButtonButton.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 11/10/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
open class MWRadioButtonButton: UIButton {
   
   //
   // MARK: Properties
   private var selectedImage:UIImage! = UIImage(named: "radio-selected")
   private var unselectedImage:UIImage! = UIImage(named: "radio-unselected")

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
  
   open func initialization() {
      self.addTarget(self, action:#selector(radioSelected(sender:)), for: .touchUpInside)
      self.isSelected = false
   }
  
   override open func awakeFromNib() {
      super.awakeFromNib()
   }

   override open var isSelected: Bool {
      didSet{
         self.setImage(isSelected ? selectedImage : unselectedImage, for: UIControlState.normal)
      }
   }

   func radioSelected(sender: UIButton) {
      if sender == self {
         isSelected = !isSelected
      }
   }
}
