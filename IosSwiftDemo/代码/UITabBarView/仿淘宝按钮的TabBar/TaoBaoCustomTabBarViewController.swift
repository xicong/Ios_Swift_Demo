//
//  TaoBaoCustomTabBarViewController.swift
//  Hahn_Tabbar_Swfir
//
//  Created by Hahn on 2019/6/28.
//  Copyright © 2019 Hahn. All rights reserved.
//

import UIKit

class TaoBaoCustomTabBarViewController: UITabBarController, UITabBarControllerDelegate, TaoBaoCustomTabBarDelegate {
    
    var customTabBar1 = TaoBaoCustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customTabBar = TaoBaoCustomTabBar()
        // 取消tabBar的透明效果
        customTabBar.isTranslucent = false
        // 设置tabBar的代理
        customTabBar.myDelegate = self
        self.customTabBar1 = customTabBar
        self.setValue(customTabBar, forKey: "tabBar")
        
        self.setUpTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - 控制器的信息
    func setUpTabBar() {
        
        let demo1VC  = TabBarSubPage1();
        let demo2VC  = TabBarSubPage2();
        let demo3VC  = TabBarSubPage3();
        let demo4VC  = TabBarSubPage4();
        let demo5VC  = TabBarSubPage5();
        
        self.creatTabbarView(viewController:demo1VC, image: "home_unselected", selectImage: "home_selected", title: "首页",tag: 0)
        self.creatTabbarView(viewController:demo2VC, image: "find_unselected", selectImage: "find_selected", title: "发现",tag: 1)
        self.creatTabbarView(viewController:demo3VC, image: "add_unselected", selectImage: "add_selected", title: "添加",tag: 2)
        self.creatTabbarView(viewController:demo4VC, image: "friend_unselected", selectImage: "friend_selected", title: "朋友",tag: 3)
        self.creatTabbarView(viewController:demo5VC, image: "mine_unselected", selectImage: "mine_selected", title: "我的",tag: 4)
        
        
        self.tabBar.tintColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 13/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        
        self.viewControllers = [
            UINavigationController(rootViewController: demo1VC),
            UINavigationController(rootViewController: demo2VC),
            UINavigationController(rootViewController: demo3VC),
            UINavigationController(rootViewController: demo4VC),
            UINavigationController(rootViewController: demo5VC),
        ];
        
        self.delegate = self
    }
    
    // MARK: - TabBar里面的文字图片
    func creatTabbarView(viewController:UIViewController, image:NSString, selectImage:NSString, title:NSString, tag:NSInteger) {
        // alwaysOriginal 始终绘制图片原始状态，不使用Tint Color。
        viewController.tabBarItem.image = UIImage(named: image as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.title = title as String
        viewController.tabBarItem.tag = tag
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        if viewController.tabBarItem.tag != 0{
            self.customTabBar1.plusButton.isSelected = false
            self.customTabBar1.plusButton.isHidden = true
            self.viewControllers?[0].tabBarItem.image = UIImage.init(named: "home_unselected")?.withRenderingMode(.alwaysOriginal)
            self.viewControllers?[0].tabBarItem.title = "首页"
        }

        return true
    }
    
    // MARK: -- TaoBaoCustomTabBarDelegate
    func tabBarDidClickPlusButton(tabBar:TaoBaoCustomTabBar) {
        self.selectedIndex = 0;
        tabBar.plusButton.isSelected = false;
        tabBar.plusButton.isHidden = false;
        self.viewControllers?[0].tabBarItem.image = UIImage.init(named: "")?.withRenderingMode(.alwaysOriginal)
        self.viewControllers?[0].tabBarItem.title = ""
    }
    
}

