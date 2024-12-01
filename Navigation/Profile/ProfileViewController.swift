//
//  UserProfileViewController.swift
//  Navigation
//
//  Created by Brooklyn on 27/10/2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Perform Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupProfileHeaderView()
        setupActionButton()
    }

    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
    }

    private func setupProfileHeaderView() {
        view.addSubview(profileHeaderView)
        profileHeaderView.configure(avatarImage: UIImage(named: "catImage") ?? UIImage(),
                                    fullName: "Hipster Cat",
                                    status: "Waiting for something...")
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    private func setupActionButton() {
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
