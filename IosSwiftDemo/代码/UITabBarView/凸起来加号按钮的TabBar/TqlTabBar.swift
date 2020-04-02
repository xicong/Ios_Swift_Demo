//
//  TqlTabBar.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

class TqlTabBar: UITabBarController {
    
    var customTabBar1 = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "凸起来的加号按钮的TabBar"
        let customTabBar = CustomTabBar()
        // 取消tabBar的透明效果
        customTabBar.isTranslucent = false
        // 设置tabBar的代理
        customTabBar.myDeleate = self as CustomTabBarDelegate
        self.customTabBar1 = customTabBar
        self.setValue(customTabBar, forKey: "tabBar")
        
        self.customTabBar1.datePickBlock = {str in
            print(str)
        }
        self.customTabBar1.dictDataBlock = { dict in
            print(dict)
        }
        
        self.setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setTabBar(){
        
        let page1 = TabBarSubPage1()
        let page2 = TabBarSubPage2()
        let page3 = TabBarSubPage3()
        
        
        self.setTabbarItemStyle(viewController:page1, img: "home_unselected", selectImg: "home_selected", title: "首页",tag: 1)
        self.setTabbarItemStyle(viewController:page2, img: "find_unselected", selectImg: "find_selected", title: "发现",tag: 2)
        self.setTabbarItemStyle(viewController:page3, img: "add_unselected", selectImg: "add_selected", title: "添加",tag: 3)
        
        self.tabBar.tintColor = UIColor.gray
        self.tabBar.isTranslucent = true
        self.viewControllers = [
            UINavigationController(rootViewController: page1),
            UINavigationController(rootViewController: page2),
            UINavigationController(rootViewController: page3),
        ]
        self.delegate = self
    }
    
    
    func setTabbarItemStyle(viewController:UIViewController,img:NSString,selectImg:NSString,title: NSString,tag:NSInteger){
        viewController.tabBarItem.image = UIImage(named: img as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImg as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.title = title as String
        viewController.tabBarItem.tag = tag
        
//        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(hex:"#1296db")], for: .selected)
//        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(hex:"#cdcdcd")], for: .normal)
        
//        if(tag == 2){
//            viewController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5) //设置图片的间距
//            viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 0.1)], for:.normal)
//        }else{
//            viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)], for:.normal)
//        }
    }
    
}

extension TqlTabBar : UITabBarControllerDelegate,CustomTabBarDelegate{
    func tabBarOnClickPlusBtn() {
        /**
         definesPresentationContext这一属性决定了那个父控制器的View，
         将会以优先于UIModalPresentationCurrentContext这种呈现方式来展现自己的View。
         如果没有父控制器设置这一属性，那么展示的控制器将会是根视图控制器
         modalPresentationStyle可以设置模态是否隐藏
         */
        self.customTabBar1.plusBtn.isSelected = true
        
        let page6 = TqlNewPage()
        self.definesPresentationContext = true
        //page6.view.backgroundColor = UIColor.clear
        //page6.modalPresentationStyle = .custom
        self.present(page6, animated: true, completion: nil)
        
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.customTabBar1.plusBtn.isSelected = false
        return true
    }
    
    
    
}
