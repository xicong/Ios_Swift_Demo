//
//  LieBiao.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/20.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit


//https://www.jianshu.com/p/cd89fca051c3
class LieBiao : UIViewController{
    
    
    var aresa = ["西安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安","咸阳","汉中","安康","宝鸡","延安"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="UITableView的Demo"
        
        let tableView = UITableView(frame: self.view.bounds,style: .plain)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}


extension LieBiao : UITableViewDelegate,UITableViewDataSource{
    
    //有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aresa.count
    }
    
    //单元格怎么显示的
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
        if(cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = "标题"
        cell?.detailTextLabel?.text = "内容"
        cell?.imageView?.image = UIImage(named: "无用")
        
        return cell!
    }
    
    //选中
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你选中我了\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    
}
