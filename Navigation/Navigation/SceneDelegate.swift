import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let factory = MyLoginFactory()
    lazy var inspector = factory.makeLoginInspector()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            self.window?.rootViewController = createTabBar()
            self.window?.makeKeyAndVisible()
        }
        createPhotosArray()
    }
    
    func createFeedNavigationController() -> UINavigationController {
        let feedVC = FeedViewController()
        let feedImage = UIImage(systemName: "house")
        feedVC.title = "Feed"
        feedVC.tabBarItem = UITabBarItem(
            title: "Feed",
            image: feedImage,
            selectedImage: nil
        )
        return UINavigationController(rootViewController: feedVC)
    }
    
    func createProfileNavigationController() -> UINavigationController {
        let logInViewController = LogInViewController()
        logInViewController.checkerDelegate = inspector
        
        let profileImage = UIImage(systemName: "person")
        logInViewController.navigationController?.navigationBar.barTintColor = UIColor.systemGray
        logInViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: profileImage,
            selectedImage: nil
        )
        return UINavigationController(rootViewController: logInViewController)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        tabBar.tabBar.backgroundColor = .white
        tabBar.viewControllers = [createFeedNavigationController(), createProfileNavigationController()]
        
        return tabBar
    }
    
}

