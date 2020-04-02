//
//  TabBarViewController.swift
//  Hahn_Tabbar_Swfir
//
//  Created by Hahn on 2019/6/24.
//  Copyright © 2019 Hahn. All rights reserved.
//

import UIKit

class ReddianJiaobiaoTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - 控制器的信息
    func setUpTabBar() {
        
        let reddian1  = JbTabBarSubage()
        let reddian2  = TabBarSubPage2()
        let reddian3  = TabBarSubPage3()
        let reddian4  = TabBarSubPage4()
        let reddian5  = TabBarSubPage5()
        
        self.creatJiaoBiaoTabbarView(viewController:reddian1, image: "home_unselected", selectImage: "home_selected", title: "首页")
        self.creatJiaoBiaoTabbarView(viewController:reddian2, image: "find_unselected", selectImage: "find_selected", title: "发现")
        self.creatJiaoBiaoTabbarView(viewController:reddian3, image: "add_unselected", selectImage: "add_selected", title: "添加")
        self.creatJiaoBiaoTabbarView(viewController:reddian4, image: "friend_unselected", selectImage: "friend_selected", title: "朋友")
        self.creatJiaoBiaoTabbarView(viewController:reddian5, image: "mine_unselected", selectImage: "mine_selected", title: "我的")
        
        self.tabBar.tintColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 13/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        
        self.viewControllers = [
            UINavigationController(rootViewController: reddian1),
            UINavigationController(rootViewController: reddian2),
            UINavigationController(rootViewController: reddian3),
            UINavigationController(rootViewController: reddian4),
            UINavigationController(rootViewController: reddian5),
        ];
        
        self.tabBarController?.tabBar.badgeImage = UIImage(named: "补贴")
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 0)
        
    }
    
    // MARK: - TabBar里面的文字图片
    func creatJiaoBiaoTabbarView(viewController:UIViewController, image:NSString, selectImage:NSString, title:NSString) {
        // alwaysOriginal 始终绘制图片原始状态，不使用Tint Color。
        viewController.tabBarItem.image = UIImage(named: image as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage as String)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title as String
    }
    
}
