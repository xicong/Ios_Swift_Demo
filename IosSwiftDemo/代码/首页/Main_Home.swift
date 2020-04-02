//
//  Main_Home.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/4/2.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

class Main_Home : UIViewController{
    
    var dataArr = [
        "列表",
        "TabBar",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiTabView = UITableView(frame: self.view.bounds,style: .plain)
        self.view.addSubview(uiTabView)
        uiTabView.dataSource = self
        uiTabView.delegate = self
        
    }
    
}

extension Main_Home : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
        if(cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let lb = LieBiao()
            lb.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(lb, animated: true)
            return
        }
        if(indexPath.row == 1){
            let tabBar = MyUiTabBarView()
            tabBar.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(tabBar, animated: true)
            return
        }
    }
    
}
