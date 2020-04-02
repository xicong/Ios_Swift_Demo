//
//  JdTabBar.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/4/1.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

class JdTabBar : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setWhiteBackgroundColor()
        self.view.backgroundColor = UIColor.blue
        self.setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setTabBar(){
        
        let page1 = JdqtTabBarSubPage();
        let page2 = TabBarSubPage2();
        let page3 = TabBarSubPage3();
        let page4 = TabBarSubPage4();
        let page5 = TabBarSubPage5();
        
        self.createTabItem(uIViewController:page1, img: "home_unselected", selectImg: "home_selected", title: "首页",tag: 0)
        self.createTabItem(uIViewController:page2, img: "find_unselected", selectImg: "find_selected", title: "发现",tag: 1)
        self.createTabItem(uIViewController:page3, img: "add_unselected", selectImg: "add_selected", title: "添加",tag: 2)
        self.createTabItem(uIViewController:page4, img: "friend_unselected", selectImg: "friend_selected", title: "朋友", tag: 4)
        self.createTabItem(uIViewController:page5, img: "mine_unselected", selectImg: "mine_selected", title: "我的",tag: 5)
        
        
        self.tabBar.tintColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 13/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        self.viewControllers = [
            UINavigationController(rootViewController: page1),
            UINavigationController(rootViewController: page2),
            UINavigationController(rootViewController: page3),
            UINavigationController(rootViewController: page4),
            UINavigationController(rootViewController: page5),
        ]
        
    }
    
    func createTabItem(uIViewController:UIViewController,img:NSString,selectImg:NSString,title:NSString,tag:NSInteger){
        //alwaysOriginal 始终绘制图片原始状态，不使用TintColor
        uIViewController.tabBarItem.image = UIImage(named: img as String)?.withRenderingMode(.alwaysOriginal)
        uIViewController.tabBarItem.selectedImage = UIImage(named: selectImg as String)?.withRenderingMode(.alwaysOriginal)
        uIViewController.title = title as String
        uIViewController.tabBarItem.tag = tag
    }
    
    
}
