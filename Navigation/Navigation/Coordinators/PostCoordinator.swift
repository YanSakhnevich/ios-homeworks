import UIKit

final class PostCoordinator: Coordinator {
    var onFinish: (() -> Void)?

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = PostViewController(titlePost: .titlePostViewController)
        viewController.toInfoViewController = showModalInfo
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showModalInfo() {

        let infoCoordinator = InfoCoordinator(navigationController: navigationController!)
        infoCoordinator.start()
    }
}
