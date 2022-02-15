import UIKit

final class PhotoCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?    

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = PhotoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
