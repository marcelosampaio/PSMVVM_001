//
//  ViewController.swift
//  PSMVVM_001
//
//  Created by Marcelo Sampaio on 22/01/23.

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var loginVM = LoginViewModel()
    
    // registering
    lazy var usernameTextField: UITextField = {
        let usernameTextField = BindingTextField()
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = .lightText
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.bind { [weak self] text in
            self?.loginVM.username.value = text
        }
        return usernameTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = BindingTextField()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = .lightText
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.bind { [weak self] text in
            self?.loginVM.password.value = text
        }
        return passwordTextField
    }()
    
    

    // MARK: - View  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVM.username.bind { [weak self] text in
            self?.usernameTextField.text = text
            
        }
        
        loginVM.password.bind { [weak self] text in
            self?.passwordTextField.text = text
            
        }
        
        setupUI()
    }
    
    // MARK: - UI Actions
    @objc func login() {
        print("🌴 username: \(loginVM.username.value)")
        print("🌴 password: \(loginVM.password.value)")
    }
    
    @objc func fetchLoginInfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.loginVM.username.value = "edited name"
            self?.loginVM.password.value = "999888777666"
        }
    }
    
    // MARK: - Setup User Interface
    func setupUI() {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .gray
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let fetchLoginButton = UIButton()
        fetchLoginButton.setTitle("Login Info", for: .normal)
        fetchLoginButton.backgroundColor = .blue
        fetchLoginButton.layer.cornerRadius = 4
        fetchLoginButton.layer.masksToBounds = true
        fetchLoginButton.addTarget(self, action: #selector(fetchLoginInfo), for: .touchUpInside)
        
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, loginButton, fetchLoginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)

        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }

}
