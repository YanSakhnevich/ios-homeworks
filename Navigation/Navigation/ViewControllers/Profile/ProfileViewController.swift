import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    
    var service: UserService
    var fullName: String
    var toPhotoViewController: (() -> Void)?
    
    init(service: UserService, fullName: String) {
        self.service = service
        self.fullName = fullName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
#if DEBUG
        view.backgroundColor = .red
#else
        view.backgroundColor = .blue
#endif
        view.addSubview(postTableView)
        
        setupConstraints()
        
        postTableView.dataSource = self
        postTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    // MARK: Posts table view
    private lazy var postTableView: UITableView = {
        let postTableView = UITableView(frame: .zero, style: .grouped)
        postTableView.toAutoLayout()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        postTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
        postTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifire)
        postTableView.separatorInset = .zero
        return postTableView
    }()
    
    // MARK: Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: Extention
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return postArray.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifire, for: indexPath) as? PhotoTableViewCell else { fatalError() }
            
            return cell
        case 1:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as? PostTableViewCell else { fatalError() }
            cell.configureCell(title: postArray[indexPath.row].title,
                               image: postArray[indexPath.row].image,
                               description: postArray[indexPath.row].description,
                               likes: postArray[indexPath.row].likes,
                               views: postArray[indexPath.row].views)
            let currentPost: PostData = postArray[indexPath.row]
            cell.configure(with: currentPost)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            toPhotoViewController?()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
            guard let user = service.getUser(fullName: fullName) else { return headerView}
            headerView.configure(with: user)
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
}
