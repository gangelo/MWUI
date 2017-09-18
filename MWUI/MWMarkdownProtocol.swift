//
//  MWMarkdownProtocol.swift
//  MWUI
//
//  Created by Gene M. Angelo  Jr. on 9/17/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

protocol MWMarkdownProtocol {
   var text:String? { get set }
   var attributedText:NSAttributedString? { get set }
   var font:UIFont! { get set }
}

extension MWMarkdownProtocol {
   mutating func applyMarkdown() {
      self.attributedText = self.getMarkdown()
   }
   
   func getMarkdown() -> NSAttributedString {
      return self.getMarkdownAsMutable().copy() as! NSAttributedString
   }
   
   func getMarkdownAsMutable() -> NSMutableAttributedString {
      if self.text == nil || self.text!.isEmpty {
         return NSMutableAttributedString(string: "")
      } else {
         var font:UIFont? = nil
         let mutableAttributedString = self.attributedText?.mutableCopy() as! NSMutableAttributedString
         
         // Bold italic
         font = UIFont(name: self.font.fontName + "-BoldItalic", size: self.font.pointSize)
         self.apply(pattern: "(\\^.*?\\^)", attributes: [NSFontAttributeName : font as Any], replacementStrings: ["^"], to: mutableAttributedString)
         
         // Bold
         font = UIFont(name: self.font.fontName + "-Bold", size: self.font.pointSize)
         self.apply(pattern: "(__.*?__)|(\\*\\*.*?\\*\\*)", attributes: [NSFontAttributeName : font as Any], replacementStrings: ["**", "__"], to: mutableAttributedString)
         
         // Italics
         font = UIFont(name: self.font.fontName + "-Italic", size: self.font.pointSize)
         self.apply(pattern: "(_.*?_)|(\\*.*?\\*)", attributes: [NSFontAttributeName : font as Any], replacementStrings: ["*", "_"], to: mutableAttributedString)
         
         return mutableAttributedString
      }
   }
   
   func apply(pattern:String, attributes:[String: Any], replacementStrings:[String], to mutableAttributedString:NSMutableAttributedString) {
      if self.text != nil {
         var matches = self.getRanges(for: pattern, in: mutableAttributedString)
         
         while(matches.count > 0) {
            let match = matches[0]
            let matchRange = match.range
            
            mutableAttributedString.addAttributes(attributes, range: matchRange)
            self.replaceCharacters(in: mutableAttributedString, using: replacementStrings, within: matchRange)
            
            matches = self.getRanges(for: pattern, in: mutableAttributedString)
         }
      }
   }
   
   func getRanges(for pattern:String, in mutableAttributedString: NSMutableAttributedString) -> [NSTextCheckingResult] {
      if let text = (mutableAttributedString as AnyObject).mutableString {
         let regex = try! NSRegularExpression(pattern: pattern)
         let range = NSMakeRange(0, text.length)
         let matches = regex.matches(in: text as String, range: range)
         return matches
      } else {
         return [NSTextCheckingResult()]
      }
   }
   
   func replaceCharacters(in attributedText:NSMutableAttributedString, using replacementStrings:[String], within range: NSRange) {
      let attributedSubstring = attributedText.attributedSubstring(from: range)
      var attributedTextRawString = attributedSubstring.string
      for replacementString in replacementStrings {
         attributedTextRawString = attributedTextRawString.replacingOccurrences(of: replacementString, with: "")
      }
      attributedText.replaceCharacters(in: range, with: attributedTextRawString)
   }
}
