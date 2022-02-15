import UIKit

final class ProfileCoordinator: Coordinator {

    var service: UserService
    var fullName: String

    private weak var navigationController: UINavigationController?
    

    init(navigationController: UINavigationController, service: UserService, fullName: String) {
        self.navigationController = navigationController
        self.service = service
        self.fullName = fullName
    }

    func start() {
        let viewController = ProfileViewController(service: service, fullName: fullName)
        viewController.toPhotoViewController = toPhotoViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func toPhotoViewController() {
        let photoCoordinator = PhotoCoordinator(navigationController: navigationController!)
        photoCoordinator.start()
    }
    
}
