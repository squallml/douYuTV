//
//  PageTitleView.swift
//  douYuTV
//
//  Created by 胡锦龙 on 2016/10/12.
//  Copyright © 2016年 胡锦龙. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

// MARK:- 定义PageTitleView类
class PageTitleView: UIView {
    // MARK: - 定义属性
    fileprivate var titles: [String]
    
    // MARK: - 懒加载
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    }()
    
    
    // MARK: - 定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        // 设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView{
    // 设置UI
    fileprivate func setupUI(){
        addSubview(scrollView)
        scrollView.frame = bounds

        // 添加title对应的Label
        setupTitleLabels()
        
        // 设置底线和滑动线
        setupBottomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLabels(){
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor(r:kNormalColor.0, g:kNormalColor.1, b:kNormalColor.2)
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            
            let labelX = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
        }
        
    }
    
    fileprivate func setupBottomLineAndScrollLine(){
        // 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH - kScrollLineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 添加滑动线
        guard let firstLabel = titleLabels.first else{return}
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: firstLabel.frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        scrollView.addSubview(scrollLine)
    }
}






