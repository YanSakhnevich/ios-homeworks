import UIKit

final class LogInCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private let factory = MyLoginFactory()
    lazy var inspector = factory.makeLoginInspector()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let viewController = LogInViewController()
        let profileImage = UIImage(systemName: "person.badge.plus")
        viewController.navigationController?.navigationBar.barTintColor = UIColor.systemGray
        viewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: profileImage,
            selectedImage: nil
        )
        viewController.dataFromLogInViewController = toProfileViewController(service:fullName:)
        viewController.checkerDelegate = inspector
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func toProfileViewController(service: UserService, fullName: String) {
        let profileCoordinator = ProfileCoordinator(navigationController: navigationController, service: service, fullName: fullName)
        profileCoordinator.start()

    }
}
