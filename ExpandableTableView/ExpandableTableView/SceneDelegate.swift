//
//  SceneDelegate.swift
//  ExpandableTableView
//
//  Created by 윤병일 on 2023/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}

