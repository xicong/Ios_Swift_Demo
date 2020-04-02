//
//  JbTabBarSubage.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/4/1.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class JbTabBarSubage : UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        
        let uiLab = UILabel(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height+(self.navigationController?.navigationBar.frame.size.height)!+(self.tabBarController?.navigationController?.navigationBar.frame.height)!,width: 100, height: 50))
        uiLab.backgroundColor = UIColor.green
        uiLab.textAlignment = .center
        uiLab.text = "首页"
        self.view.addSubview(uiLab)
        
        self.tabBarController?.tabBar.badgeImage = UIImage(named: "补贴")
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 0)
        
        
        let badgePoint = CGPoint(x: 25, y: -3)
        self.tabBarController?.tabBar.badgePoint = badgePoint
        self.tabBarController?.tabBar.badgeSize = CGSize(width: 20, height: 20)
        self.tabBarController?.tabBar.badgeColor = UIColor.red
        self.tabBarController?.tabBar.badgeValue = "1"
        self.tabBarController?.tabBar.badgeImage = UIImage(named: "")
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 1)

        let badgePoint1 = CGPoint(x: 25, y: -3)
        self.tabBarController?.tabBar.badgePoint = badgePoint1
        self.tabBarController?.tabBar.badgeSize = CGSize(width: 10, height: 10)
        self.tabBarController?.tabBar.badgeColor = UIColor.red
        self.tabBarController?.tabBar.badgeValue = ""
        self.tabBarController?.tabBar.badgeImage = UIImage(named: "")
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 2)

        let badgePoint2 = CGPoint(x: 25, y: -3)
        self.tabBarController?.tabBar.badgePoint = badgePoint2
        self.tabBarController?.tabBar.badgeSize = CGSize(width: 20, height: 20)
        self.tabBarController?.tabBar.badgeColor = UIColor.red
        self.tabBarController?.tabBar.badgeValue = "3"
        self.tabBarController?.tabBar.badgeImage = UIImage(named: "")
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 3)
    }
    
}
