//
//  FeedVC.swift
//  Navigation
//
//  Created by Yan Sakhnevich on 16.10.2021.
//

import UIKit

class FeedVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemGray
        button.setTitle("Go to Post", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
   
    }
    
    @objc func didTapButton() {
        let vc = PostVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }



}
