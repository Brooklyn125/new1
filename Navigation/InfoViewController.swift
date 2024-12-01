//
//  InfoViewController.swift
//  Navigation
//
//  Created by Brooklyn on 10/10/2024.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }

    @objc func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "This is an alert message.", preferredStyle: .alert)

        let action1 = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK tapped")
        }

        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel tapped")
        }

        alert.addAction(action1)
        alert.addAction(action2)

        present(alert, animated: true, completion: nil)
    }
}

