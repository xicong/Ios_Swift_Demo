//
//  TabBarSubPage1.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

class TabBarSubPage5: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        self.title = "我的"
        
        let uiLab = UILabel(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height+(self.navigationController?.navigationBar.frame.size.height)!+(self.tabBarController?.navigationController?.navigationBar.frame.height)!,width: 100, height: 50))
        uiLab.backgroundColor = UIColor.green
        uiLab.textAlignment = .center
        uiLab.text = "我的"
        self.view.addSubview(uiLab)
        
        let  backBtn = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 50));
        backBtn.backgroundColor = UIColor.red
        backBtn.setTitle("返回", for: .normal)
        backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        self.view.addSubview(backBtn)
    }
    
    @objc func backClick(){
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
}
