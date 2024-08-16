//
//  RegisterView.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

protocol RegisterViewDelegate: AnyObject {
    func signUpTapped()
}

class RegisterView: BaseView {
    
    private let joinLabel: UILabel = {
        let view = UILabel()
        view.text = "Join Unsplash"
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .white
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = " First name"
        let placeholderColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        return field
    }()
    
    private lazy var surnameTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = " Last name"
        let placeholderColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        return field
    }()
    
    private lazy var usernameTextField: UITextField = {
        var field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .clear
        field.textColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = " Username"
        let placeholderColor = UIColor.lightGray
        field.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        return field
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
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("By joining, you agree to the Terms and Privacy Policy.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: RegisterViewDelegate?
    
    override func setUp() {
        super.setUp()
        
        signUpButton.addTarget(
            self,
            action: #selector(signUpTapped),
            for: .touchUpInside
        )
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(joinLabel)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(usernameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(signUpButton)
        addSubview(termsButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                joinLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
                joinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                
                nameTextField.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 30),
                nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                nameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 18),
                surnameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                surnameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                surnameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                usernameTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 18),
                usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                usernameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 18),
                emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                emailTextField.heightAnchor.constraint(equalToConstant: 40),
                
                passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
                passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                passwordTextField.heightAnchor.constraint(equalToConstant: 40),
                
                signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
                signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                signUpButton.heightAnchor.constraint(equalToConstant: 40),
                
                termsButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 22),
                termsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
                termsButton.heightAnchor.constraint(equalToConstant: 22),
                termsButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                termsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            ]
        )
    }
    
    @objc
    private func signUpTapped() {
        delegate?.signUpTapped()
    }
}
