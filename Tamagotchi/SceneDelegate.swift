//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let shared = UserDefaultsManager.shared
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // SceneDelegate의 프로퍼티에 설정
        window = UIWindow(windowScene: windowScene)
        
        var mainView = UINavigationController(rootViewController: HomeViewController())
        
        // Tamagotchi 각 모델의 rawValue는 1부터이므로 0이 나오면 저장된 데이터가 없는 것
        // 저장된 데이터가 있다면 Main vc 불러오고 다마고치 데이터 넣어주기
        if shared.selectedTamagotchiRawValue != 0 {
            let vc = MainViewController()
            vc.tamagotchi = Tamagotchi.list[shared.selectedTamagotchiRawValue-1]
            mainView = UINavigationController(rootViewController: vc)
        }
        
        // 처음 보여질 화면을 root로 설정하고 보여주기
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
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

