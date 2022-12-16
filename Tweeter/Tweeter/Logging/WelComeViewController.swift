//
//  WelComeViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//


import UIKit

class WelcomeviewController: UIViewController {
    
    private let twitterLogo : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 200, y: 100, width: 50, height: 50))
       // image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "tweet")
        image.contentMode = .scaleAspectFit
       
        return image
    }()
    
    private let welcomeLabel : UILabel = {
        let welcomeLable = UILabel()
        welcomeLable.translatesAutoresizingMaskIntoConstraints = false
        welcomeLable.textColor = .label
        welcomeLable.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        welcomeLable.textAlignment = .center
        welcomeLable.backgroundColor = .clear
        welcomeLable.numberOfLines = 0
        welcomeLable.text = "See What's Happening in The World right now."
        return welcomeLable
    }()
    
    private let createAcountButton : UIButton = {
        let createAccountButton = UIButton()
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        createAccountButton.backgroundColor = .systemBlue
        createAccountButton.layer.cornerRadius = 20
        //createAccountButton.isEnabled = false
        return createAccountButton
    }()
    
    private let logInLabel : UILabel = {
        let label = UILabel()
        label.text = "Have an account Already?"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
        
    }()
    
    private let logInButton : UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = .clear
        loginButton.setTitle("Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
       
        return loginButton
    }()
    
    @objc func addSigninTarget(sender:UIButton){
        let createAccountVC = SigninViewController()
        self.navigationController?.pushViewController(createAccountVC, animated: true)
        
    }
    
    @objc func addLoginTarget(){
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func configureConstraints(){
        // wellCome label
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:  20).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        
        // createAccount Button
        createAcountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 20).isActive = true
        createAcountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        createAcountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor,constant: -20).isActive = true
        
        // logInLabel
        logInLabel.leadingAnchor.constraint(equalTo:self.view.leadingAnchor,constant: 30).isActive = true
        logInLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        logInLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logInLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -80).isActive = true
        
        // logInButton
        logInButton.leadingAnchor.constraint(equalTo: logInLabel.trailingAnchor,constant: -50).isActive = true
        logInButton.topAnchor.constraint(equalTo: logInLabel.topAnchor).isActive = true
        logInButton.bottomAnchor.constraint(equalTo: logInLabel.bottomAnchor).isActive = true
        
      
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(twitterLogo)
        self.view.backgroundColor = . systemBackground
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(createAcountButton)
        self.view.addSubview(logInLabel)
        self.view.addSubview(logInButton)
        createAcountButton.addTarget(self, action: #selector(addSigninTarget(sender:)), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(addLoginTarget), for: .touchUpInside)
        configureConstraints()
   
    }
   

}
