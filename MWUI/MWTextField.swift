//
//  MWTextField.swift
//
//  Created by Gene M. Angelo  Jr. on 9/8/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//
import UIKit

@IBDesignable
open class MWTextField: UITextField {
   fileprivate var images:MWImagesProtocol = MWDefaultImages()
   fileprivate var _imageView:UIView?
   
   //
   // MARK: - Constructors
   
   override public init(frame: CGRect) {
      super.init(frame: frame)
      self.initialize()
   }
   
   required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      self.initialize()
   }
   
   //
   // MARK: - Initializers
   
   open func initialize() {
   }
   
   open func initialize(with profile: MWProfileProtocol) {
     if let font = self.font {
         self.font = font.withSize(profile.fontSize)
      }
      self.textColor = profile.textColor
      self.backgroundColor = profile.backgroundColor
      self.layer.borderColor = profile.borderColor.cgColor
      self.layer.borderWidth = profile.borderWidth
   }

   //
   // MARK: - Design time attributes
   
   @IBInspectable open var paddingX: CGFloat = 8.0
   
   open func attach(textFieldProfile:MWImagesProtocol) {
      self.images = textFieldProfile
   }
   
   //
   // MARK: - Image functions
   
   public func setWaiting() {
      self.clear()
      let imageView = self.images.waitingImageView
      self.setImage(imageView: imageView)
      imageView.startAnimating()
      
      self.onWaiting()
   }
   
   public func setSuccess() {
      self.clear()
      self.setImage(image: self.images.successImage)
      
      self.onSuccess()
   }
   
   public func setError(error:String = "") {
      self.clear()
      self.setImage(image: self.images.errorImage)
      
      self.onError(error)
   }
   
   public func setErrorOrClear(with error:String?) {
      self.clear()
      if ((error ?? "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != "") {
         self.setError(error: error!)
      }
   }
   
   fileprivate func setImage(image:UIImage?) {
      if (image == nil) {
         return
      }
      
      let imageView = UIImageView(image: image)
      self.setImage(imageView: imageView)
   }
   
   fileprivate func setImage(imageView:UIImageView) {
      let imageWidth:CGFloat = 12
      let imageHeight:CGFloat = 12
      
      imageView.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
      
      self._imageView = UIView()
      self._imageView?.addSubview(imageView)
      
      self._imageView?.frame = CGRect(x: 0, y: 0, width: imageWidth + self.images.getDefaultImagePadding(), height: imageHeight)
      
      self.addSubview(self._imageView!)
      
      self.rightView = self._imageView
      self.rightViewMode = .always
      
      attachTapGesture(imageView: imageView)
   }
   
   public func clear() {
      // Remove the image attached to the textfield
      if let imageView = self._imageView {
         imageView.subviews.first?.removeFromSuperview()
      }
      
      self.onClear()
   }
   
   func attachTapGesture(imageView:UIImageView) {
      let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
      tap.numberOfTapsRequired = 1
      imageView.isUserInteractionEnabled = true
      imageView.addGestureRecognizer(tap)
   }
   
   func tap(_ gestureRecognizer: UITapGestureRecognizer) {
      self.clear()
   }
   
   //
   // MARK: - Overrides
   
   // Add padding
   override open func textRect(forBounds bounds: CGRect) -> CGRect {
      return self.getBounds(forBounds: bounds)
   }
   
   // Add padding
   override open func editingRect(forBounds bounds: CGRect) -> CGRect {
      return self.getBounds(forBounds: bounds)
   }
   
   fileprivate func getBounds(forBounds bounds: CGRect) -> CGRect {
       return CGRect(x: bounds.origin.x + self.paddingX, y: bounds.origin.y, width: bounds.width, height: bounds.height)
   }
   
   //
   // MARK: - Callbacks
   
   open func onWaiting() {}
   open func onSuccess() {}
   open func onError(_ error:String) {}
   open func onClear() {}
}
