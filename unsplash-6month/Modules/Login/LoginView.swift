//
//  LogInView.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginTapped()
    func recoveryTapped()
    func registerTapped()
}

class LoginView: BaseView {
    
    private let loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Login"
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .white
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = " Email"
        let placeholderColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        return field
    }()
    
    private lazy var passwordTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(systemName: "eye"))
        imageView.tintColor = .gray
        
        field.rightView = imageView
        field.rightViewMode = .always
        
        let placeholderText = " Password"
        let placeholderColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let recoveryPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Don't have an account? Join", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: LoginViewDelegate?
    
    override func setUp() {
        super.setUp()
        
        loginButton.addTarget(
            self,
            action: #selector(loginTapped),
            for: .touchUpInside
        )
        
        recoveryPasswordButton.addTarget(
            self,
            action: #selector(recoveryTapped),
            for: .touchUpInside
        )
        
        registerButton.addTarget(
            self,
            action: #selector(registerTapped),
            for: .touchUpInside
        )
        
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(recoveryPasswordButton)
        addSubview(registerButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
                loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                
                emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
                emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                emailTextField.heightAnchor.constraint(equalToConstant: 40),
                
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
                passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                passwordTextField.heightAnchor.constraint(equalToConstant: 40),
                
                loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
                loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                loginButton.heightAnchor.constraint(equalToConstant: 40),
                
                recoveryPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 22),
                recoveryPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                recoveryPasswordButton.heightAnchor.constraint(equalToConstant: 22),
                recoveryPasswordButton.widthAnchor.constraint(equalToConstant: 150),
                
                registerButton.topAnchor.constraint(equalTo: recoveryPasswordButton.bottomAnchor, constant: 46),
                registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                registerButton.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
    }
    
    @objc
    private func loginTapped() {
        delegate?.loginTapped()
    }
    
    @objc
    private func recoveryTapped() {
        delegate?.recoveryTapped()
    }
    
    @objc
    private func registerTapped() {
        delegate?.registerTapped()
    }
}
