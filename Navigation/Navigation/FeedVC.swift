//
//  FeedVC.swift
//  Navigation
//
//  Created by Yan Sakhnevich on 16.10.2021.
//

import UIKit

class FeedVC: UIViewController {
    
    private let titlePostVC = Post(title: "Some Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemGray
        button.setTitle("Go to Post", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
   
    }
   
    
    @objc func didTapButton() {
        let post = PostVC(titlePost: titlePostVC.title)
        navigationController?.pushViewController(post, animated: true)
    }
}

struct Post {
    let title: String
}



