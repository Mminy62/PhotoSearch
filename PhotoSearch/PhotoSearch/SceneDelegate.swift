//
//  SceneDelegate.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/18/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene) // 빈 유리판
        let tab = UITabBarController()
        let view01 = ViewController()
        let view02 = TopicViewController()
//        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = tab
        tab.setViewControllers([view01, view02], animated: true)
        view01.tabBarItem = UITabBarItem(title: "첫 번째 아이템", image: UIImage(named: "img.png"), tag: 0)
        view02.tabBarItem = UITabBarItem(title: "두 번째 아이템", image: UIImage(named: "img.png"), tag: 1)
        tab.tabBar.backgroundColor = .gray
        window?.makeKeyAndVisible() // 화면에 안보이는 오류 방지
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

