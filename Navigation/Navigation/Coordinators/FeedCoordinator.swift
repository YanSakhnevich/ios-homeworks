import UIKit

final class FeedCoordinator: Coordinator {
    var onFinish: (() -> Void)?

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = FeedViewController()
        viewController.feedCoordinator = self
        let feedImage = UIImage(systemName: "house")
        viewController.title = "Feed"
        viewController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: feedImage,
            selectedImage: nil
        )
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    func pushToPost() {
        let postCoordinator = PostCoordinator(navigationController: navigationController!)
        postCoordinator.start()
    }
    
}
