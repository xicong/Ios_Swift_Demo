    //
    //  File.swift
    //  IosSwiftDemo
    //
    //  Created by xc on 2020/4/1.
    //  Copyright © 2020 xc. All rights reserved.
    //
    
    import UIKit
    
    class SlidingTabBarSubPage : SuperViewController{
        
        private var tableView: UITableView!
        private var array: NSMutableArray! = NSMutableArray()
        private var oldOffset:CGFloat!
        
        
        deinit {
            self.removeObserver(self, forKeyPath: "isSliding", context: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setWhiteBackgroundColor()
            self.title = "首页"
            
            let uiLab = UILabel(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height+(self.navigationController?.navigationBar.frame.size.height)!+(self.tabBarController?.navigationController?.navigationBar.frame.height)!,width: 100, height: 50))
            uiLab.backgroundColor = UIColor.green
            uiLab.textAlignment = .center
            uiLab.text = "发现"
            self.view.addSubview(uiLab)
            
            
            // 设置KVO、观察者
            self.addObserver(self, forKeyPath: "isSliding", options: .new, context: nil)
            
            for i in 0..<100 {
                self.array.add(i)
            }
            
            tableView = UITableView(frame: self.view.bounds, style: .plain);
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
        }
        
    }
    
    
    extension SlidingTabBarSubPage: UITableViewDelegate, UITableViewDataSource{
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
            self.oldOffset = scrollView.contentOffset.y
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
            // 向下
            if scrollView.contentOffset.y > self.oldOffset {
                let number:NSNumber = 0
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "isSliding"), object: number)
                
            }
                // 向上
            else{
                let number:NSNumber = 1
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "isSliding"), object: number)
                
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return self.array.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = UITableViewCell()
            cell.textLabel?.text = "No." + String(indexPath.row) + "  (点击返回)"
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            //        self.tabBarController?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
