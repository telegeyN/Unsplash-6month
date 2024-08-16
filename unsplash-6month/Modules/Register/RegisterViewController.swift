//
//  RegisterViewController.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerView: RegisterView = {
        let view = RegisterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currentNavigationController: UINavigationController? {
            return self.navigationController
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        registerView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(registerView)
    }
    
    private func setupNavItem() {
        let backImage = UIImage(systemName: "chevron.left")
        let backButton = UIButton(type: .system)
        backButton.setImage(backImage, for: .normal)
        backButton.setTitle("Login", for: .normal)
        backButton.tintColor = .white
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        backButton.contentHorizontalAlignment = .left
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)

        let barButtonItem = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                registerView.topAnchor.constraint(equalTo: view.topAnchor),
                registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension RegisterViewController: RegisterViewDelegate {
    
    func signUpTapped() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
