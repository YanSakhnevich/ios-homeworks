import UIKit


class FeedViewController: UIViewController {
    
    lazy var stack = UIStackView()
    private let viewModel: FeedViewModel
        
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stack.subviews.forEach({ $0.removeFromSuperview() })
        viewModel.send(.viewIsReady)
    }
    
    private func setupViewModel() {
        viewModel.onStateChanged = { [weak self] state in // тут мы принимаем от модели изменение ее состояния и реагируем на них
            guard let self = self else { return }

            switch state {
                
            case .initial:
                self.setupView()
                self.configureStack()
                self.setupLayout()
                
            case let .passwordIsCompared(check):
                self.markTextField(check: check)

            }
        }
    }
    
    
    func configureStack() {
        let _ = ["First button", " Second button "].map { txt in
            let button = CustomButton(title: txt, titleColor: .white, buttonAction: didTapButton)
            self.stack.addArrangedSubview(button)
            self.stack.axis = .vertical
            self.stack.distribution = .fillProportionally
            self.stack.spacing = 10
            self.stack.toAutoLayout()
        }
    }
    
    @objc func didTapButton() {
        viewModel.send(.centralButtonTapped)
    }
    
    private lazy var textForSendingTextField: CustomTextField = {
        let textField = CustomTextField {}
        
        return textField
    }()
    
    
    private lazy var sendTextButton: CustomButton = {
        let button = CustomButton(title: "Send password for check", titleColor: .white) { [ weak self ] in
            guard let self = self else { return }
            let textFieldString = self.textForSendingTextField.text ?? ""
            self.viewModel.send(.sendTextButtonTapped(textFieldString))

        }
        return button
    }()
    
    private func markTextField(check: Bool) {
        textForSendingTextField.layer.borderWidth = 3
        textForSendingTextField.layer.borderColor = check ? UIColor.green.cgColor : UIColor.red.cgColor
        
    }
    
    
    //MARK: Setup View and Layout
    
    private func setupView() {
        view.backgroundColor = .systemMint
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupLayout() {
        let views: [UIView] = [
            sendTextButton,
            textForSendingTextField,
            stack
        ]
        view.addSubviews(views)
        
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






