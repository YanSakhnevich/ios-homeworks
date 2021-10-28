

import UIKit

class ProfileVC: UIViewController {
    
    private var statusText: String = ""
    
    lazy var profileHeaderView: ProfileHeaderView = {
        profileHeaderView = ProfileHeaderView()
        profileHeaderView.showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        return profileHeaderView
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
        profileHeaderView.toAutoLayout()
        setupLayout()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
