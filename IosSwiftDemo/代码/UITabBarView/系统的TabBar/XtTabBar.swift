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
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setTabBar()
    }
    
    func setTabBar(){
        
        let xtTabBar1 = TabBarSubPage1()
        let xtTabBar2 = TabBarSubPage2()
        let xtTabBar3 = TabBarSubPage3()
        let xtTabBar4 = TabBarSubPage4()
        let xtTabBar5 = TabBarSubPage5()
        
        self.setTabbarItemStyle(viewController:xtTabBar1, img: "home_unselected", selectImg: "home_selected", title: "首页")
        self.setTabbarItemStyle(viewController:xtTabBar2, img: "find_unselected", selectImg: "find_selected", title: "发现")
        self.setTabbarItemStyle(viewController:xtTabBar3, img: "add_unselected", selectImg: "add_selected", title: "添加")
        self.setTabbarItemStyle(viewController:xtTabBar4, img: "friend_unselected", selectImg: "friend_selected", title: "朋友")
        self.setTabbarItemStyle(viewController:xtTabBar5, img: "mine_unselected", selectImg: "mine_selected", title: "我的")
        
        self.tabBar.tintColor = UIColor.gray
        self.tabBar.isTranslucent = true
        self.viewControllers = [
            UINavigationController(rootViewController: xtTabBar1),
            UINavigationController(rootViewController: xtTabBar2),
            UINavigationController(rootViewController: xtTabBar3),
            UINavigationController(rootViewController: xtTabBar4),
            UINavigationController(rootViewController: xtTabBar5),
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
