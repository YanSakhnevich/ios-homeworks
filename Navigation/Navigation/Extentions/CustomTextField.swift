import UIKit

final class CustomTextField: UITextField {
    
    private let changeText: () -> Void
    
    var passwordText: String = ""
    
    init(changeText: @escaping () -> Void) {
        self.changeText = changeText
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(inputText), for: .editingChanged)
        self.toAutoLayout()
        self.backgroundColor = .white
        self.placeholder = "Введите пароль"
        self.text = ""
        self.leftViewMode = .always
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = Constants.borderWidth
        self.backgroundColor = .white
        self.leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 10,
            height: self.frame.height)
        )
        self.keyboardType = .emailAddress
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 16)
        self.autocapitalizationType = .none
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.returnKeyType = .done
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc
    private func inputText() {
        self.changeText()

    }
}
