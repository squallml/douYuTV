//
//  HomeViewController.swift
//  douYuTV
//
//  Created by 胡锦龙 on 2016/10/3.
//  Copyright © 2016年 胡锦龙. All rights reserved.
//

import UIKit

// 设置titleView高度
private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    lazy var pageTitleView:PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH+kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
}

// MARK: - 设置UI
extension HomeViewController{
    fileprivate  func setupUI(){
        // ScrollView不需要内边距
        automaticallyAdjustsScrollViewInsets = false
        // 设置导航栏
        setupUINavigationBar()
        // 添加TitleView
        view.addSubview(pageTitleView)
    }
    
    // MARK: - 设置导航栏
    private func setupUINavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let sise = CGSize(width: 36, height: 36)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", sise: sise)
        let scanItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", sise: sise)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", sise: sise)
        
        navigationItem.rightBarButtonItems = [historyItem,scanItem,searchItem]
    }
}
