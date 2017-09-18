//
//  MWProfileProtocol.swift
//
//  Created by Gene M. Angelo  Jr. on 9/8/17.
//  Copyright © 2017 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public protocol MWProfileProtocol {
   var textColor:UIColor { get set }
   var fontSize:CGFloat { get set }
   var backgroundColor:UIColor? { get set  }
   var borderWidth:CGFloat { get set  }
   var borderColor:UIColor { get set  }
}
