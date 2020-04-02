//
//  JdqtTabBarSubPage.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/4/2.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class JdqtTabBarSubPage : SuperViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let pushBtn = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        pushBtn.setTitle("push", for: .normal)
        pushBtn.backgroundColor = UIColor.red
        // 这里的#selector 不要重名
        pushBtn.addTarget(self, action: #selector(pushBtnCkick), for: .touchUpInside)
        self.view.addSubview(pushBtn)
        
    }
    
    
    // MARK: - push按钮
    @objc func pushBtnCkick(){
        let jdqtNewPage = JdqtNewPage()
        jdqtNewPage.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(jdqtNewPage, animated: true)
    }
}
