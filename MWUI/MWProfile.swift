//
//  MWProfile.swift
//
//  Created by Gene M. Angelo  Jr. on 8/9/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

open class MWProfile: MWProfileProtocol {
   fileprivate var _textColor:UIColor
   fileprivate var _fontSize:CGFloat
   fileprivate var _backgroundColor:UIColor?
   fileprivate var _borderWidth:CGFloat
   fileprivate var _borderColor:UIColor
   
   public convenience init() {
      self.init(textColor: UIColor.black, fontSize: 10.0, backgroundColor: UIColor.clear, borderWidth: 0.5, borderColor: UIColor.black)
   }
   
   public init(textColor:UIColor, fontSize:CGFloat, backgroundColor:UIColor, borderWidth:CGFloat, borderColor:UIColor) {
      
      self._textColor = textColor
      self._fontSize = fontSize
      self._backgroundColor = backgroundColor
      self._borderWidth = borderWidth
      self._borderColor = borderColor
   }
   
   // MARK: - MWProfileProtocol - start
   
   public var textColor:UIColor {
      get {
         return self._textColor
      }
      set {
         self._textColor = newValue
      }
   }
   
   public var fontSize: CGFloat {
      get {
         return self._fontSize
      }
      set {
         self._fontSize = newValue
      }
   }
   
   public var backgroundColor:UIColor? {
      get {
         return self._backgroundColor
      }
      set {
         self._backgroundColor = newValue
      }
   }
   
   public var borderWidth:CGFloat {
      get {
         return self._borderWidth
      }
      set {
         self._borderWidth = newValue
      }
   }
   
   public var borderColor:UIColor {
      get {
         return self._borderColor
      }
      set {
         self._borderColor = newValue
      }
   }
   
   // MWProfileProtocol - end

}
