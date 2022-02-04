import UIKit

final class InfoCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = InfoViewController()
        navigationController?.present(viewController, animated: true, completion: nil)

    }
}
