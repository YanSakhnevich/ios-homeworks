import UIKit


class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private(set) var statusText: String = ""
    
    static let identifire = "ProfileHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemGray6
        addView()
        statusTextField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Add logoImageView
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: Constants.logoImage)
        logoImageView.toAutoLayout()
        logoImageView.clipsToBounds = true
        logoImageView.layer.cornerRadius = Constants.logoImageViewCornerRadius
        logoImageView.layer.borderWidth = Constants.logoImageViewBorderWidth
        logoImageView.layer.borderColor = Constants.logoImageViewBorderColor
        
        return logoImageView
    }()
    
    // MARK: Add nameLabel
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.toAutoLayout()
        nameLabel.text = .nameLabelText
        nameLabel.textColor = Constants.nameLabelColor
        nameLabel.font = Constants.nameLabelFont
        
        return nameLabel
    }()
    
    // MARK: Add statusLabel
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.toAutoLayout()
        statusLabel.text = .statusLabelText
        statusLabel.numberOfLines = Constants.statusLabelNumberOfLines
        statusLabel.textColor = Constants.statusLabelColor
        statusLabel.font = Constants.statusLabelFont
        
        return statusLabel
    }()
    
    // MARK: Add showStatusButton
    lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.toAutoLayout()
        showStatusButton.backgroundColor = Constants.showStatusButtonColor
        showStatusButton.roundedButtonWithShadow(
            corderRadius: Constants.showStatusButtonCornerRadius,
            shadowOffset: Constants.showStatusShadowOffset,
            shadowRadius: Constants.showStatusShadowRadius,
            shadowColor: Constants.showStatusShadowColor,
            shadowOpacity: Constants.showStatusShadowOpacity
        )
        showStatusButton.setTitle(.showStatusButtonText, for: .normal)
        showStatusButton.setTitleColor(.lightGray, for: .highlighted)
        showStatusButton.addTarget(self,
                                   action: #selector(pressButton),
                                   for: .touchUpInside
        )
        
        return showStatusButton
    }()
    
    
    
    // MARK: Add statusTextField
    lazy var statusTextField: UITextField = {
        
        let statusTextField = UITextField()
        statusTextField.toAutoLayout()
        statusTextField.roundedTextField(
            cornerRadius: Constants.statusTextFieldCornerRadius,
            borderWidth: Constants.statusTextFieldBorderWidth,
            borderColor: Constants.statusTextFieldBorderColor
        )
        statusTextField.backgroundColor = Constants.statusTextFieldBackgroundColor
        statusTextField.font = Constants.statusTextFieldFont
        statusTextField.textColor = Constants.statusTextFieldColor
        statusTextField.leftView = UIView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 10,
                                                        height: statusTextField.frame.height)
        )
        statusTextField.leftViewMode = .always
        statusTextField.placeholder = .placeholderText
        statusTextField.addTarget(self,
                                  action: #selector(statusTextChanged),
                                  for: .editingChanged
        )
        statusButtonDisable()
        
        return statusTextField
    }()
    
    // MARK: Add Subviews
    func addView() {
        let views: [UIView] = [
            logoImageView,
            nameLabel,
            statusLabel,
            statusTextField,
            showStatusButton
        ]
        
        contentView.addSubviews(views)
        self.setupConstraints()
        
    }
    
    // MARK: Button Action
    @objc func pressButton(){
        if statusLabel.text != nil && statusText != "" {
            statusLabel.text = statusText
            statusTextField.text = ""
            statusTextField.resignFirstResponder()
            statusButtonDisable()
            
        }
    }
    
    // MARK: statusButton state
    @objc func statusButtonEnable(){
        showStatusButton.isEnabled = true
        showStatusButton.alpha = 1
        
    }
    
    @objc func statusButtonDisable(){
        showStatusButton.isEnabled = false
        showStatusButton.alpha = 0.5
        
    }
    
    //MARK: TextField Action
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusButtonEnable()
        statusText = text
        showStatusButton.resignFirstResponder()
    }
    
    // MARK: Constraints
    private func setupConstraints() {
        
        contentView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            
            self.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            self.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: Constants.contentViewHeight),
            
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoImageViewWidth),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: Constants.labelPadding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.padding),
            
            statusLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: Constants.labelPadding),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -Constants.statusLabelBottomAnchor),
            statusLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -Constants.padding),
            
            statusTextField.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: Constants.padding),
            statusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -Constants.statusTextFieldBottomAnchor),
            statusTextField.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -Constants.padding),
            statusTextField.heightAnchor.constraint(equalToConstant: Constants.statusTextFieldHeight),
            
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.padding),
            showStatusButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.showStatusButtonPadding),
            showStatusButton.heightAnchor.constraint(equalToConstant: Constants.showStatusButtonHeight),
            
        ])
    }
}

// MARK: Extention
extension ProfileHeaderView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == " " {
            return false
        }
        return true
        
    }
}
