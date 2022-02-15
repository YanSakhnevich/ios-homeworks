import UIKit

protocol ViewControllerFactoryProtocol {
    func viewController(for typeOfViewController: TypeOfViewController) -> UIViewController
}

enum TypeOfViewController {
    case feed(viewModel: FeedViewModel)
}

extension TypeOfViewController {
    func createViewController() -> UIViewController {
        switch self {
        case .feed(let viewModel):
            return FeedViewController(viewModel: viewModel)
        }
    }
}

class ViewControllerCreationFactory: ViewControllerFactoryProtocol  {
    
    func viewController(for typeOfViewController: TypeOfViewController) -> UIViewController {
        return typeOfViewController.createViewController()
    }
}
