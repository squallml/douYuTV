//
//  UIColor-Extension.swift
//  douYuTV
//
//  Created by 胡锦龙 on 2016/10/12.
//  Copyright © 2016年 胡锦龙. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
