//
//  ViewController.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/20.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class MainVc: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        
        //给UIImageView增加点击事件
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageOnclick))
//        tapGestureRecognizer.numberOfTapsRequired = 2   //识别为双击 默认是单击
        self.img.isUserInteractionEnabled = true
        self.img.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageOnclick(){
        //去UiTabView
//        let lb = LieBiao()
//        self.present(lb, animated: true, completion:nil)
//        self.navigationController?.pushViewController(lb, animated: true)

        
        //去UiTabBar
        let uiTabBarPage = MyUiTabBarView()
        self.navigationController?.pushViewController(uiTabBarPage, animated: true)
    }
    
    
    @IBAction func btnOnClick(_ sender: Any) {
        print("btnOnClick")
    }
    
    
}

