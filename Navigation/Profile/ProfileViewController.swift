//
//  UserProfileViewController.swift
//  Navigation
//
//  Created by Brooklyn on 27/10/2024.
//

import UIKit

struct UserPost {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

class ProfileViewController: UIViewController {
    
    private let posts: [UserPost] = [
        UserPost(author: "Darth Vader", description: "Dark side of the force...", image: "starImage", likes: 520, views: 812),
        UserPost(author: "Sam Winchester", description: "With Bro", image: "superImage", likes: 1040, views: 1200),
        UserPost(author: "Silver Surfer", description: "See ya on the lineup!", image: "surfImage", likes: 590, views: 1800),
        UserPost(author: "Elon Musk", description: "Future is now.", image: "teslaImage", likes: 940, views: 978)
    ]
    
    private let tableView = UITableView()
    private let profileHeaderView = ProfileTableHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        tableView.tableHeaderView = profileHeaderView
        setupProfileHeader()
    }
    
    private func setupProfileHeader() {
        profileHeaderView.configure(
            avatarImage: UIImage(named: "catImage") ?? UIImage(),
            fullName: "Hipster Cat",
            status: "Waiting for something..."
        )
        
        adjustHeaderHeight()
    }
    
    private func adjustHeaderHeight() {
        profileHeaderView.setNeedsLayout()
        profileHeaderView.layoutIfNeeded()
        
        let headerHeight = profileHeaderView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = profileHeaderView.frame
        frame.size.height = headerHeight
        profileHeaderView.frame = frame
        tableView.tableHeaderView = profileHeaderView
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
}
