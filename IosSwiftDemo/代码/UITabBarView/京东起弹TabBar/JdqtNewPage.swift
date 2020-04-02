//
//  JdqtNewPage.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/4/2.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class JdqtNewPage : UIViewController{
    
    var str:String!
    
    // MARK: - 类似OC dealloc
    deinit {
        self.removeObserver(self, forKeyPath: "isAnimation", context: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        // 设置KVO、观察者
        self.addObserver(self, forKeyPath: "isAnimation", options: .new, context: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let number:NSNumber = 0
        
        // 对KVO、观察者发送信息
        //        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "isAnimation"), object: number)
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "isAnimation"), object: number)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let number:NSNumber = 1
        // 对KVO、观察者发送信息
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "isAnimation"), object: number)
    }
}
