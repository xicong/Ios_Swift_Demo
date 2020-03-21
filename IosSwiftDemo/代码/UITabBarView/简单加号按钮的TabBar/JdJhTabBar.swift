//
//  JdJhTabBar.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

class JdJhTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "简单加号按钮的TabBar"
        self.setTabBar()
    }
    
    func setTabBar(){
        
        let page1 = TabBarSubPage1()
        let page2 = TabBarSubPage2()
        let page3 = TabBarSubPage3()
        let page4 = TabBarSubPage4()
        let page5 = TabBarSubPage5()
        
        
        self.setTabbarItemStyle(viewController:page1, img: "首页_未选中", selectImg: "首页_选中", title: "首页",tag: 1)
        self.setTabbarItemStyle(viewController:page2, img: "发现_未选中", selectImg: "发现_选中", title: "发现",tag: 2)
        self.setTabbarItemStyle(viewController:page3, img: "post_normal", selectImg: "", title: "",tag: 3)
        self.setTabbarItemStyle(viewController:page4, img: "朋友_未选中", selectImg: "朋友_选中", title: "朋友",tag: 4)
        self.setTabbarItemStyle(viewController:page5, img: "我的_未选中", selectImg: "我的_选中", title: "我的",tag: 5)
        
        self.tabBar.tintColor = UIColor.gray
        self.tabBar.isTranslucent = true
        self.viewControllers = [
            UINavigationController(rootViewController: page1),
            UINavigationController(rootViewController: page2),
            UINavigationController(rootViewController: page3),
            UINavigationController(rootViewController: page4),
            UINavigationController(rootViewController: page5),
        ]
        self.delegate = self
    }
    
    
    func setTabbarItemStyle(viewController:UIViewController,img:NSString,selectImg:NSString,title: NSString,tag:NSInteger){
        viewController.tabBarItem.image = UIImage(named: img as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImg as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.title = title as String
        viewController.tabBarItem.tag = tag
        
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(hex:"#1296db")], for: .selected)
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(hex:"#cdcdcd")], for: .normal)
        
        if(tag == 3){
            viewController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5) //设置图片的间距
            viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 0.1)], for:.normal)
        }else{
            viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)], for:.normal)
        }
    }
    
}

extension JdJhTabBar : UITabBarControllerDelegate{
    
    //选中的时候
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if(viewController.tabBarItem.tag == 3){
            
        /**definesPresentationContext这一属性决定了那个父控制器的View，将会以优先于UIModalPresentationCurrentContext这种呈现方式来展示自己的View，如果没有父控制器设置这一属性，那么展示的控制器将会是跟视图控制器
           modalPresentationStyle可以设置模态是否隐藏
             */
            
            let page6 = TabBarSubPage6()
            self.definesPresentationContext = true
//            page6.view.backgroundColor = UIColor.clear
            self.present(page6, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
}
