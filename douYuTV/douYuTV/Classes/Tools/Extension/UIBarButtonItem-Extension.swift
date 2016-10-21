//
//  UIBarButtonItem-Extension.swift
//  douYuTV
//
//  Created by 胡锦龙 on 2016/10/6.
//  Copyright © 2016年 胡锦龙. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName:String, highImageName:String = "", sise:CGSize = CGSize.zero) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        if(highImageName != ""){
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        if(sise == CGSize.zero){
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: .zero, size: sise)
        }
        self.init(customView:btn)
    }
}
