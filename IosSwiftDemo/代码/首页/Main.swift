//
//  ViewController.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/20.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class Main: UITabBarController {
    
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setWhiteBackgroundColor()
        
        //给UIImageView增加点击事件
        //let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageOnclick))
        //tapGestureRecognizer.numberOfTapsRequired = 2   //识别为双击 默认是单击
        //self.img.isUserInteractionEnabled = true
        //self.img.addGestureRecognizer(tapGestureRecognizer)
        
        
        self.initTabBar()
    }
    
    func initTabBar(){
        let main_home = Main_Home()
        
        self.setTabbarItemStyle(viewController:main_home, img: "home_unselected", selectImg: "home_selected", title: "首页")
        
        self.tabBar.isTranslucent = true;
        
        self.viewControllers = [
            UINavigationController(rootViewController: main_home),
        ]
    }
    
    func setTabbarItemStyle(viewController:UIViewController,img:NSString,selectImg:NSString,title:NSString){
        viewController.tabBarItem.image = UIImage(named: img as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImg as String)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title as String
    }
    
    @objc func imageOnclick(){
        //去UiTabView
        //        let lb = LieBiao()
        //        self.present(lb, animated: true, completion:nil)
        //        self.navigationController?.pushViewController(lb, animated: true)
        
        
        //去UiTabBar
        //        let uiTabBarPage = MyUiTabBarView()
        //        self.navigationController?.pushViewController(uiTabBarPage, animated: true)
    }
    
    
    
    
}

