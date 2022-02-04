import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private lazy var tryButton: UIButton = {
        let button = CustomButton(title: .infoVCButtonName, titleColor: .white) {
            Alert.showIncompleteFormAlert(on: self)
        }
        
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = UIColor.rgb(255, 55, 95, 1)
        view.isOpaque = false
        view.addSubview(tryButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tryButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tryButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
}
