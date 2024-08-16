//
//  ViewController.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var currentNavigationController: UINavigationController? {
            return self.navigationController
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loginView.delegate = self
        setUp()
        setupNavItem()
    }
    
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(loginView)
    }
    
    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                loginView.topAnchor.constraint(equalTo: view.topAnchor),
                loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginTapped() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func recoveryTapped() {
    }
    
    func registerTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
