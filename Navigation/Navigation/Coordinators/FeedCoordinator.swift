import UIKit

final class FeedCoordinator: Coordinator {

    private var navigationController: UINavigationController
    let myFactory: ViewControllerFactoryProtocol = ViewControllerCreationFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let model = FeedViewModel()
        model.feedCoordinator = self
        guard let viewController = myFactory.viewController(for: .feed(viewModel: model)) as? FeedViewController else { return }
        let feedImage = UIImage(systemName: "house")
        viewController.title = "Feed"
        viewController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: feedImage,
            selectedImage: nil
        )
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func pushToPost() {
        let postCoordinator = PostCoordinator(navigationController: navigationController)
        postCoordinator.start()
    }
}
