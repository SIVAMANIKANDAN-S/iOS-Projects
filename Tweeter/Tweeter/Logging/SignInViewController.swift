//
//  SignInViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//
//


import UIKit
import Combine

class SigninViewController: UIViewController {
    
    private let validateRegisteration = SignInValidation()
    private var subscription: Set<AnyCancellable> = []
    
   
    
    private let createAccountLabel : UILabel = {
        let createAccountLabel = UILabel()
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        createAccountLabel.textColor = .label
        createAccountLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        createAccountLabel.textAlignment = .center
        createAccountLabel.backgroundColor = .clear
        createAccountLabel.numberOfLines = 0
        createAccountLabel.text = "Create your account"
        return createAccountLabel
    }()
    
    private let emailTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        email.keyboardType = .emailAddress
        email.layer.borderWidth = 0.5
        email.layer.cornerRadius = 25
        email.layer.borderColor = UIColor.systemBlue.cgColor
        email.textColor = .black
        email.backgroundColor = .white
        email.leftViewMode = .always
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        return email
        
    }()
    private let passwordTextField : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 25
        password.layer.borderColor = UIColor.systemBlue.cgColor
        password.isSecureTextEntry = true
        password.textColor = .black
        password.backgroundColor = .white
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        return password
        
    }()
    
    private let registerButton : UIButton = {
        let registerButton = UIButton(type: .system)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitle("Create account", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
       
        registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        registerButton.layer.cornerRadius = 25
        registerButton.layer.masksToBounds = true
        registerButton.tintColor = .white
        registerButton.isEnabled = false
        
        return registerButton
    }()
    
    func configureConstraints(){
        // createAccountLabel
        createAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        createAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        createAccountLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        
        //eamil
        emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor,constant: 30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //password
        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //register Button
        registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 200).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30).isActive = true
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 30).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc func bindEmailToAuthMAnager(){
        validateRegisteration.email = emailTextField.text
        validateRegisteration.validateRegisterationform()
    }
    @objc func bindPasswordToAuthManager(){
        validateRegisteration.password = passwordTextField.text
        validateRegisteration.validateRegisterationform()
    }
    
    private func setTargetsToRegisterFields(){
        emailTextField.addTarget(self, action: #selector(bindEmailToAuthMAnager), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(bindPasswordToAuthManager), for: .editingChanged)
        validateRegisteration.$isRegisterationFormValid.sink { [weak self] validated in
            self?.registerButton.isEnabled = validated
           
        }.store(in: &subscription)
        
        validateRegisteration.$user.sink {[weak self] user in
            guard user != nil else{return}
            guard let vc = self?.navigationController?.viewControllers.first as? WelcomeviewController else{return}
                    vc.dismiss(animated: true)
        }.store(in: &subscription)
        
        validateRegisteration.$error.sink { [weak self] errorMessage in
            guard let error = errorMessage else{return}
            self?.signinAlert(error: error)
        }.store(in: &subscription)
    }
    
    private func signinAlert(error : String){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle:.alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
        
    }
    
    
    
    @objc func didTapOutside(){
        view.endEditing(true)
    }
    
    
    @objc private func didTapCreatAccountButton(){
        validateRegisteration.createUser()
        present(ProfileDataGettingViewController(), animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBackground
        view.addSubview(createAccountLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        configureConstraints()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOutside)))
        
        setTargetsToRegisterFields()
        
        registerButton.addTarget(self, action: #selector(didTapCreatAccountButton), for: .touchUpInside)
    

       
    }
    


   

}
