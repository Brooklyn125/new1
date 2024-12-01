//
//  PostViewController.swift
//  Navigation
//
//  Created by Brooklyn on 10/10/2024.
//

import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {

    var post: Post

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = post.title

        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc func showInfo() {
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        present(infoVC, animated: true, completion: nil)
    }
}

