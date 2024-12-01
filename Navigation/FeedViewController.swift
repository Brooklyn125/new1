//
//  FeedViewController.swift
//  Navigation
//
//  Created by Brooklyn on 10/10/2024.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"

        let button = UIButton(type: .system)
        button.setTitle("Go to Post", for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }

    @objc func showPost() {
        let post = Post(title: "My First Post")
        let postVC = PostViewController(post: post)
        navigationController?.pushViewController(postVC, animated: true)
    }
}
