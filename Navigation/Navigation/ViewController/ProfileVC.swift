

import UIKit

class ProfileVC: UIViewController {
    
    private var statusText: String = ""
    
    lazy var profileHeaderView: ProfileHeaderView = {
        profileHeaderView = ProfileHeaderView()
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }


}
