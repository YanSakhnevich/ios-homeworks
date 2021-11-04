import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }

        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            self.window?.rootViewController = createTabBar()
            self.window?.makeKeyAndVisible()
        }
    }
    
    func createFeedNC() -> UINavigationController {
        let feedVC = FeedVC()
        let feedImage = UIImage(systemName: "list.bullet.rectangle.portrait")
        feedVC.title = "Feed"
        feedVC.tabBarItem = UITabBarItem(
            title: "Feed",
            image: feedImage,
            selectedImage: nil
        )
        return UINavigationController(rootViewController: feedVC)
    }
    
    func createProfileNC() -> UINavigationController {
        let profileVC = ProfileVC()
        let profileImage = UIImage(systemName: "person")
        profileVC.navigationController?.navigationBar.barTintColor = UIColor.systemGray
        profileVC.tabBarItem = UITabBarItem(
            title: "Profile",
            image: profileImage,
            selectedImage: nil
        )
        return UINavigationController(rootViewController: profileVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemOrange
        tabBar.tabBar.backgroundColor = .white
        tabBar.viewControllers = [createFeedNC(), createProfileNC()]
        
        return tabBar
    }

}

