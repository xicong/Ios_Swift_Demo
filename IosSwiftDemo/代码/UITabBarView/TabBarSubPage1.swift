//
//  TabBarSubPage1.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

class TabBarSubPage1: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        self.title = "首页"
        
        
        let uiLab = UILabel(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height+(self.navigationController?.navigationBar.frame.size.height)!+(self.tabBarController?.navigationController?.navigationBar.frame.height)!,width: 100, height: 50))
        uiLab.backgroundColor = UIColor.green
        uiLab.textAlignment = .center
        uiLab.text = "首页"
        self.view.addSubview(uiLab)
    
    }
    
}
