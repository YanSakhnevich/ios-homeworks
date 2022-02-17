import UIKit

final class InfoCoordinator: Coordinator {

    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = InfoViewController()
        navigationController.present(viewController, animated: true, completion: nil)

    }
}
