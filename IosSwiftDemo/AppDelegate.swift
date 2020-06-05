//
//  AppDelegate.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/20.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit

/**
 ios 13之前全权处理App的生命周期和Ui的生命周期
 
 ios 13之后只处理App的生命周期
 */
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    
    //会返回一个创建场景时需要的UISceneConfiguration对象
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    //很简单。 当用户通过“应用程序切换器”关闭一个或多个场景时，即会调用该方法。 您可以在该函数中销毁场景所使用的资源，因为不会再需要它们。
    //当用户通过“应用切换器”关闭一个或多个场景时会被调用
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    /// 程序进入前台
    func applicationDidBecomeActive(_ application: UIApplication) {
        //        NotificationCenter.default.post(name: IntoForegroundKey, object: nil)
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        NotificationCenter.default.post(
            name: NSNotification.Name("vc_applicationDidBecomeActive"),
            object: nil)
    }
    
    
    //程序进入后台的时候
    func applicationDidEnterBackground(_ application: UIApplication) {
        //        NotificationCenter.default.post(name: IntoBackgroundKey, object: nil)
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        NotificationCenter.default.post(
            name: NSNotification.Name("vc_applicationDidEnterBackground"),
            object: nil)
    }
    
    //app从后台进入前台
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        //        HWPrint("***************app从后台进入前台****************")
        
        //        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["Renish":"Dadhaniya"])
        //http://www.imooc.com/wenda/detail/568092
        NotificationCenter.default.post(
            name: NSNotification.Name("vc_applicationWillEnterForeground"),
            object: nil)
    }
    
    
    //监听屏幕解锁
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        NotificationCenter.default.post(
            name:NSNotification.Name("vc_applicationProtectedDataDidBecomeAvailable"), object: nil)
    }


}

