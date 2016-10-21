//
//  MainViewController.swift
//  douYuTV
//
//  Created by 胡锦龙 on 2016/10/2.
//  Copyright © 2016年 胡锦龙. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
        
    }
    

    /// 从Storyboard创建控制器
    func addChildVC(storyName:String) {
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC)
    }
    

}
