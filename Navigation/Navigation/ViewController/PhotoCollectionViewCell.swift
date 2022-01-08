import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "PhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photo)
        setupConstraints()
    }
    
    // MARK: Photo image
    private lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.toAutoLayout()
        
        return photo
    }()
    
    // MARK: Cell config
    public func configureCell(image: UIImage) {
        self.photo.image = image
    }
    
    // MARK: Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.topAnchor),
            photo.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
