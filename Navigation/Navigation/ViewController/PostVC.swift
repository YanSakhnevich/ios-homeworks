//
//  PostVC.swift
//  Navigation
//
//  Created by Yan Sakhnevich on 16.10.2021.
//

import UIKit

class PostVC: UIViewController {
    private let titlePost: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titlePost
        configureItems()
        view.backgroundColor = .systemGreen
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    init(titlePost: String) {
        self.titlePost = titlePost
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: .done,
            target: self,
            action: #selector(didTapButton)
        )
    }
    
    func showModal() {
        let infoVC = InfoVC()
        present(infoVC, animated: true, completion: nil)
    }
        
    @objc func didTapButton() {
       showModal()        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //            navigationController?.navigationBar.prefersLargeTitles = true
//
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = .systemBackground
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        //        appearance.accessibilityFrame.width.
//
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.compactAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//    }

}
