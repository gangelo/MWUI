//
//  MWRadioButtonButton.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 11/10/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

@IBDesignable
class MWRadioButtonButton: UIButton {
   
   //
   // MARK: Properties
   let selectedImage = UIImage(named: "radio-selected")! as UIImage
   let unselectedImage = UIImage(named: "radio-unselected")! as UIImage
   
   //
   // MARK: Initialization
   
   override func awakeFromNib() {
      self.addTarget(self, action:#selector(radioSelected(sender:)), for: .touchUpInside)
      self.isSelected = false
   }
   
   override var isSelected: Bool {
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
