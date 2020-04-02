//
//  MyUiTabBarView.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/21.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

//https://github.com/HahnLoving/Hahn_Tabbar_Swift
class MyUiTabBarView: UIViewController {
    
    /**
     Swift懒加载只会在首次使用的时候创建一次，之后再次使用或者新赋值都不会去重新创建了，而是就保存新设置的值
     */
    lazy var aarray : [String] = {
        return ["系统的TarBar","简单加号按钮的TabBar","凸起来加号按钮的Tabbar","淘宝按钮的TabBar"
            ,"动画音效按钮的TabBar","京东起弹TabBar","滑动隐藏的Tabbar","自定义小红点的TabBar"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWhiteBackgroundColor()
        self.title = "UiTabBar演示"
        
        let uiTabview = UITableView(frame: self.view.bounds,style: .plain)
        uiTabview.backgroundColor = UIColor.white
        self.view.addSubview(uiTabview)
        
        uiTabview.dataSource = self
        uiTabview.delegate = self
        
        
    }
}

extension MyUiTabBarView : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if(cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = self.aarray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            let  xtTabBar = XtTabBar()
            self.navigationController?.pushViewController(xtTabBar, animated: true)
            break
        case 1:
            let  jdJhTabBar = JdJhTabBar()
            self.navigationController?.pushViewController(jdJhTabBar, animated: true)
            break
        case 2:
            let  tqlTabBar = TqlTabBar()
            self.navigationController?.pushViewController(tqlTabBar, animated: true)
            break
        case 3:
            let  ftbanTabBar = TaoBaoCustomTabBarViewController()
            self.navigationController?.pushViewController(ftbanTabBar, animated: true)
            break
        case 4:
            let  ftbanTabBar = AnimationTabBarViewController()
            self.navigationController?.pushViewController(ftbanTabBar, animated: true)
            break
        case 5:
            let jdTabBar = JdTabBar();
            self.navigationController?.pushViewController(jdTabBar, animated: true)
            break
        case 6:
            let jdTabBar = SlidingViewController();
            self.navigationController?.pushViewController(jdTabBar, animated: true)
            break
        case 7:
            let reddianVC = ReddianJiaobiaoTabBarViewController();
            self.navigationController?.pushViewController(reddianVC, animated: true)
            break
        default:
            break
        }
    }
    
    
}


