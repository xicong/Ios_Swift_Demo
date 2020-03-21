//
//  CustomTabBar.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import Foundation
import UIKit

/**
 自定义TabView
 */
class CustomTabBar: UITabBar {
    
    var tabCount : Float = 3
    
    //声明代理
    weak var myDeleate : CustomTabBarDelegate?
    //声明一个block变量
    var datePickBlock: dateBlock?
    var dictDataBlock: dictBlock?
    
    lazy var plusBtn : UIButton = {
        let plusBtn = UIButton()
        plusBtn.setImage(UIImage.init(named: "post_normal"), for: .normal)
        plusBtn.setImage(UIImage.init(named: "post_normal"), for: .highlighted)
        plusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        plusBtn.setTitle("发布", for: .normal)
        plusBtn.setTitleColor(UIColor.gray, for: .normal)
        let buttonImg: UIImage? = plusBtn.image(for: .normal)
        let titleWidth = self
         plusBtn.titleEdgeInsets = UIEdgeInsets.init(top: buttonImg!.size.height, left: -buttonImg!.size.height, bottom: -15, right: 0)
         plusBtn.imageEdgeInsets = UIEdgeInsets.init(top: -15, left: 0, bottom: 0, right: -20)

         
         plusBtn.frame = CGRect.init(x: 0, y: 0, width: plusBtn.imageView!.image!.size.width, height: plusBtn.imageView!.image!.size.height + 40)
         plusBtn.addTarget(self, action: #selector(CustomTabBar.respondsToPlusButton), for: .touchUpInside)
        return plusBtn
    }()
    
    // MARK: - CustomTabBarDelegate
    @objc func respondsToPlusButton(){
        //和oc不一样的是，Swift中如果简单的调用代理方法, 不用判断代理能否响应
        if myDeleate != nil{
            myDeleate?.tabBarOnClickPlusBtn()
        }
    }
    
    
    // MARK: - 重写父类方法必须写
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.plusBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //block 传递
        var dick:NSMutableDictionary!
        dick = [
            "name":"hzl"
        ]
        if(self.datePickBlock != nil){
            self.datePickBlock!("参数")
        }
        if(self.dictDataBlock != nil){
            self.dictDataBlock!(dick)
        }
        
        //设置中间按钮的位置
        let x = self.frame.width * 0.5
        let y = self.frame.height * 0.1
        self.plusBtn.center = CGPoint.init(x: x, y: y)
        
        let w = self.frame.width/3
        var index = 0
        for childView:UIView in self.subviews{
            if(childView.isKind(of: NSClassFromString("UITabBarButton")!)){
                
                var isIphoneX:Bool = false
                let zeroNum:CGFloat = 0
                
                if #available(ios 11.0, *){
                    isIphoneX = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)! > zeroNum
                }
                
                if(isIphoneX){
                    childView.frame = CGRect.init(x: w * CGFloat(index), y: 0, width: w, height:self.frame.size.height - 34)
                }else{
                    childView.frame = CGRect.init(x: w * CGFloat(index), y: 0, width: w, height: self.frame.size.height )
                }
                
                index+=1
                
                if index == 1{
                    index+=1
                }
            }
        }
        
    }
    
    //监听按钮的点击，让凸起来的部分也能相应点击
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //判断是否为根控制器
        if (self.isHidden){
            //tabbar隐藏不在主页 系统处理
            return super.hitTest(point, with: event)
        }else{
            //将单击按钮触摸点转换到按钮上生成新的点
            let onButton = self.convert(point, to: self.plusBtn)
            //判断新的点是否在按钮上
            if(self.plusBtn.point(inside: onButton, with: event)){
                return plusBtn
            }else{
                //不在按钮上系统处理
                return super.hitTest(point, with: event)
            }
        }
    }
    
}

//声明一个协议ClickDelegate，需要继承NSObjectProtocol
protocol CustomTabBarDelegate : NSObjectProtocol {
    func tabBarOnClickPlusBtn()
}


//定义闭包类型
typealias dateBlock = (String)->()
typealias dictBlock = (NSMutableDictionary) -> ()

