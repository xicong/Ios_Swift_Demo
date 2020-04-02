//
//  SceneDelegate.swift
//  IosSwiftDemo
//
//  Created by xc on 2020/3/20.
//  Copyright © 2020 xc. All rights reserved.
//

import UIKit


/**
 ios 13 后新增的。用来处理ui的生命周期
 */
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
//            let uINavigationController = UINavigationController(rootViewController: mainVc)
//            self.window?.rootViewController = uINavigationController
            self.window?.rootViewController = Main();
            self.window?.makeKeyAndVisible()
        }
    }
    
    
    /**
     当场景与app断开连接是调用（注意，以后它可能被重新连接）
     */
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    /**
     当用户开始与场景进行交互（例如从应用切换器中选择场景）时，会调用
     */
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    /**
     当用户停止与场景交互（例如通过切换器切换到另一个场景）时调用
     */
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    /**
     当场景变成活动窗口时调用，即从后台状态变成开始或恢复状态
     */
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    /**
     当场景进入后台时调用，即该应用已最小化但仍存活在后台中
     */
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

