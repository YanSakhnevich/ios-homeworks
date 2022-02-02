import UIKit

class PostViewController: UIViewController {
    private let titlePost: String
    
    var toInfoViewController: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titlePost
        configureItems()
        view.backgroundColor = .systemGreen
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    init(titlePost: String) {
        self.titlePost = titlePost
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: .postViewControllerInfoSymbolName),
            style: .done,
            target: self,
            action: #selector(didTapButton)
        )
    }
    
    @objc func didTapButton() {
        toInfoViewController?()
    }
}
