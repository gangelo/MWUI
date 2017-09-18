//
//  MWViewContainer.swift
//
//  Created by Gene M. Angelo  Jr. on 9/13/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit

open class MWViewContainer: UIView {
   fileprivate var _imageView:UIView?
   fileprivate var images:MWDefaultImages = MWDefaultImages()
   
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
   
   public func setError(error:String) {
      self.clear()
      self.setImage(image: self.images.errorImage)
      
      self.onError(error)
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
      
      
      let x = (self.bounds.width - imageWidth) - self.images.getDefaultImagePadding()
      let y = self.bounds.height / 2 - imageHeight / 2
      
      self._imageView?.frame = CGRect(x: x, y: y, width: imageWidth, height: imageHeight)
      
      self.addSubview(self._imageView!)
      
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
   // MARK: - Callbacks
   
   open func onWaiting() {}
   open func onSuccess() {}
   open func onError(_ error:String) {}
   open func onClear() {}

}
