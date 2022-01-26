import UIKit

class FeedViewController: UIViewController {
    
    private let titlePostViewController = Post(title: "Some Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let myNotificationCenter = NotificationCenter.default
        myNotificationCenter.addObserver(self, selector: #selector(passwordIsRight), name: Notification.Name("passwordIsRight"), object: nil)
        myNotificationCenter.addObserver(self, selector: #selector(passwordIsNotRight), name: Notification.Name("passwordIsNotRight"), object: nil)
        
        
        let views: [UIView] = [
            sendTextButton,
            textForSendingTextField
        ]
        
        view.addSubviews(views)
        
        configureStack()
        view.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.toAutoLayout()
        setupLayout()
        
        

    }
    
    var stack = UIStackView()
    
    func configureStack() {
        let _ = ["First button", "Second button"].map { [weak self] txt in
            let button = CustomButton(title: txt, titleColor: .white, buttonAction: didTapButton)
            self?.stack.addArrangedSubview(button)
        }
    }

    
    private lazy var sendTextButton: CustomButton = {
        let button = CustomButton(title: "Send password for check", titleColor: .white) {
        }
        return button
    }()
    
    private lazy var textForSendingTextField: CustomTextField = {
        let textField = CustomTextField {}
        
        return textField
    }()
    
    @objc
    private func passwordIsRight() {
        textForSendingTextField.layer.borderWidth = 3
        textForSendingTextField.layer.borderColor = UIColor.green.cgColor

        
    }

    @objc
    private func passwordIsNotRight() {
        textForSendingTextField.layer.borderWidth = 3
        textForSendingTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    
    @objc func didTapButton() {
        let post = PostViewController(titlePost: titlePostViewController.title)
        navigationController?.pushViewController(post, animated: true)
    }
    
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        sendTextButton.snp.makeConstraints { bt in
            bt.height.equalTo(Constants.showStatusButtonHeight)
            bt.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(Constants.padding)
            bt.width.equalTo(Constants.showStatusButtonWidth)
            bt.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-Constants.padding*2)
        }
        
        textForSendingTextField.snp.makeConstraints { tf in
            tf.height.equalTo(Constants.statusTextFieldHeight)
            tf.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-Constants.padding)
            tf.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(Constants.padding)
            tf.bottom.equalTo(sendTextButton.snp.top).offset(-Constants.statusTextFieldBottomAnchor)
        }
        
    }
}


struct Post {
    let title: String
}






