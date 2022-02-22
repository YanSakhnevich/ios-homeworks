import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
        timerNumber.text = "\(durationTimer)"
        
    }
    
    private lazy var timer = Timer()
    private lazy var durationTimer = 5
    private let shapeLayer = CAShapeLayer()
    
    
    private lazy var tryButton: UIButton = {
        let button = CustomButton(title: .infoVCButtonName, titleColor: .white) { [weak self] in
            guard let self = self else { return }
            self.timerNumber.isHidden = false
            self.shapeView.isHidden = false
            self.tryButton.isHidden = true
            self.basicAnimation()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction) , userInfo: nil, repeats: true)
        }
        return button
    }()
    
    private lazy var timerNumber: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 84, weight: .bold)
        label.isHidden = true
        return label
    }()
    
    private lazy var shapeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "circle_bar")
        imageView.toAutoLayout()
        imageView.isHidden = true
        return imageView
    }()
    
    @objc func timerAction() {
        durationTimer -= 1
        timerNumber.text = "\(durationTimer)"
        if durationTimer == 0 {
            timer.invalidate()
            Alert.showIncompleteFormAlert(on: self)
            tryButton.isHidden = false
            shapeView.isHidden = true
            timerNumber.isHidden = true
            durationTimer = 5
        }
    }
    
//MARK: Animation
    private func animationCircular() {
        let center = CGPoint(x: shapeView.frame.width/2, y: shapeView.frame.height/2)
        let endAngle = (-CGFloat.pi/2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 50
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.rgb(3, 118, 93, 1).cgColor
        shapeView.layer.addSublayer(shapeLayer)
    }
    
    private func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
        
    }

    
//MARK: Setup views and constraints
    private func setupView() {
        view.backgroundColor = UIColor.rgb(255, 55, 95, 1)
        view.isOpaque = false
        view.addSubview(tryButton)
        view.addSubview(shapeView)
        view.addSubview(timerNumber)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tryButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tryButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            shapeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            shapeView.widthAnchor.constraint(equalToConstant: 320),
            shapeView.heightAnchor.constraint(equalToConstant: 320),
 
            timerNumber.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerNumber.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
}
