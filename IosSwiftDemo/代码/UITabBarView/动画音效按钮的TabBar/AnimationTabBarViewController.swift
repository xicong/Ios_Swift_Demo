//
//  AnimationTabBarViewController.swift
//  Hahn_Tabbar_Swfir
//
//  Created by Hahn on 2019/7/3.
//  Copyright © 2019 Hahn. All rights reserved.
//

import UIKit
// 音效框架
import AudioToolbox

class AnimationTabBarViewController: UITabBarController {

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
        
        let demo1VC  = TabBarSubPage1()
        let demo2VC  = TabBarSubPage2()
        let demo3VC  = TabBarSubPage3()
        let demo4VC  = TabBarSubPage4()
        let demo5VC  = TabBarSubPage5()
        
        self.creatAnimMusicTabbarView(viewController:demo1VC, image: "home_unselected", selectImage: "home_selected", title: "首页",tag: 0)
        self.creatAnimMusicTabbarView(viewController:demo2VC, image: "find_unselected", selectImage: "find_selected", title: "发现",tag: 1)
        self.creatAnimMusicTabbarView(viewController:demo3VC, image: "add_unselected", selectImage: "add_selected", title: "添加",tag: 2)
        self.creatAnimMusicTabbarView(viewController:demo4VC, image: "friend_unselected", selectImage: "friend_selected", title: "朋友",tag: 3)
        self.creatAnimMusicTabbarView(viewController:demo5VC, image: "mine_unselected", selectImage: "mine_selected", title: "我的",tag: 4)
        
        self.viewControllers = [
            UINavigationController(rootViewController: demo1VC),
            UINavigationController(rootViewController: demo2VC),
            UINavigationController(rootViewController: demo3VC),
            UINavigationController(rootViewController: demo4VC),
            UINavigationController(rootViewController: demo5VC),
        ];
        
        self.tabBar.tintColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 13/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
        self.delegate = self
    }
    
    // MARK: - TabBar里面的文字图片
    func creatAnimMusicTabbarView(viewController:UIViewController, image:NSString, selectImage:NSString, title:NSString, tag:NSInteger) {
        // alwaysOriginal 始终绘制图片原始状态，不使用Tint Color。
        viewController.tabBarItem.image = UIImage(named: image as String)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage as String)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title as String
        viewController.tabBarItem.tag = tag
    }
}


extension AnimationTabBarViewController : UITabBarControllerDelegate{
    
    //点击tabBar的时候调用
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.touchAnimation(index: item.tag)
    }
    
    func touchAnimation(index:NSInteger){
        // 得到当前tabbar的下标
        var tabbarbuttonArray:NSMutableArray!
        tabbarbuttonArray = NSMutableArray.init()
        for tabBarButton:UIView in self.tabBar.subviews {
            if tabBarButton.isKind(of: NSClassFromString("UITabBarButton")!){
                tabbarbuttonArray.add(tabBarButton)
            }
        }
        /**
         对当前下标的tabbar使用帧动画
         可以根据UI的具体要求进行动画渲染
         */
        let pulse = CABasicAnimation.init(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        pulse.duration = 0.2
        pulse.repeatCount = 1
        pulse.autoreverses = true
        pulse.fromValue = 0.7
        pulse.toValue = 1.3
        let thisView = tabbarbuttonArray[index] as! UIView
        thisView.layer.add(pulse, forKey: nil)
        
        self.playSoundEffect(name: "music", type: "wav")
    }
    
    // MARK: - 播放音效的方法
    func playSoundEffect(name:String, type:String) {
        //获取声音地址
        let resoucePath = Bundle.main.path(forResource: name, ofType: type)
        var soundID:SystemSoundID = 0
        //地址转换
        let baseURL = NSURL(fileURLWithPath: resoucePath!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        //播放声音
        AudioServicesPlaySystemSound(soundID)
        
    }
}
