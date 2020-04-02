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


}

