//
//  XtTabBar.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit
class XtTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        self.title = "系统的TabBar"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTabBar()
    }
    
    func setTabBar(){
        
        let page1 = TabBarSubPage1()
        let page2 = TabBarSubPage2()
        let page3 = TabBarSubPage3()
        let page4 = TabBarSubPage4()
        let page5 = TabBarSubPage5()
        
        self.setTabbarItemStyle(viewController:page1, img: "首页_未选中", selectImg: "首页_选中", title: "首页")
        self.setTabbarItemStyle(viewController:page2, img: "发现_未选中", selectImg: "发现_选中", title: "发现")
        self.setTabbarItemStyle(viewController:page3, img: "添加_未选中", selectImg: "添加_选中", title: "添加")
        self.setTabbarItemStyle(viewController:page4, img: "朋友_未选中", selectImg: "朋友_选中", title: "朋友")
        self.setTabbarItemStyle(viewController:page5, img: "我的_未选中", selectImg: "我的_选中", title: "我的")
        
        self.tabBar.tintColor = UIColor.gray
        self.tabBar.isTranslucent = true
        self.viewControllers = [
            UINavigationController(rootViewController: page1),
            UINavigationController(rootViewController: page2),
            UINavigationController(rootViewController: page3),
            UINavigationController(rootViewController: page4),
            UINavigationController(rootViewController: page5),
        ]
    }
    
    //设置TabBar里面不同状态的文字图片
    //cdcdcd 没选中色值
    //1296db 选中的色值
    func setTabbarItemStyle(viewController:UIViewController,img:NSString,selectImg:NSString,title:NSString){
        viewController.tabBarItem.image = UIImage(named: img as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImg as String)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title as String
    }
    
    
}
