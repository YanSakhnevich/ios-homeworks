import UIKit

class ApplicationCoordinator: BaseCoordinator, Coordinator {
    
    private let feedNavigationController = UINavigationController()
    private let logInNavigationController = UINavigationController()

    
    private var window: UIWindow?
    private let scene: UIWindowScene
    
    init(scene: UIWindowScene) {
        self.scene = scene
        super.init()
    }
    
    func start() {
        startMainFlow()
        initWindow()

    }
    
    private func startMainFlow() {
        
        let feedCoordinator = FeedCoordinator(navigationController: feedNavigationController)
        addDependency(feedCoordinator)
        feedCoordinator.start()
        
        let logInCoordinator = LogInCoordinator(navigationController: logInNavigationController)
        addDependency(logInCoordinator)
        logInCoordinator.start()
        
        _ = createTabBar()
        
    }
    private func initWindow () {
        let window = UIWindow(windowScene: scene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        self.window = window
        createPhotosArray()
    }
}

// MARK: Extension for ApplicationCoordinator
extension ApplicationCoordinator {
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        tabBar.tabBar.backgroundColor = .white
        tabBar.setViewControllers([feedNavigationController,logInNavigationController], animated: false)

        return tabBar
    }
}
