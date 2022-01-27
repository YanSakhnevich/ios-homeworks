import UIKit

final class CustomButton: UIButton {

    private var buttonAction: () -> Void

    init(title: String, titleColor: UIColor, buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(tapForCheck), for: .touchUpInside)

        self.toAutoLayout()
        self.backgroundColor = UIColor.rgb(10, 132, 255, 1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = 12


    }
    
    @objc
    private func tapForCheck() {
        self.buttonAction()
    }

    required init?(coder: NSCoder) {
        nil
    }
}
