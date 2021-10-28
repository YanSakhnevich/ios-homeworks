

import UIKit

class ProfileVC: UIViewController {
    
    private var statusText: String = ""
    
    lazy var profileHeaderView: ProfileHeaderView = {
        profileHeaderView = ProfileHeaderView()
        profileHeaderView.showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        return profileHeaderView
    }()
    
    
    let statusButton: UIButton = {
        let button = MyButton(frame: .zero)
        button.blueButton(title: "Another button")
        return button
    }()
    
    override func loadView() {
        super.loadView()
        profileHeaderView.backgroundColor = .lightGray
        title = "Profile"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeaderView)
        view.backgroundColor = .white
        profileHeaderView.toAutoLayout()
        view.addSubview(statusButton)
        statusButton.toAutoLayout()
        setupLayout()
    }
    
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()


    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            statusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            statusButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            statusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
         ])
    }
    
    @objc func buttonPressed() {
        profileHeaderView.statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusText = text
        
    }
}
