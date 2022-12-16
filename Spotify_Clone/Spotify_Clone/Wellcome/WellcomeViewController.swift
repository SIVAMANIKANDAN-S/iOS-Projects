//
//  WellcomeViewController.swift
//  Spotify_Clone
//
//  Created by zs-mac-3 on 01/11/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WellcomeDisplayLogic: class
{
    func displaySomething(viewModel: Wellcome.Something.ViewModel)
}



class WellcomeViewController: UIViewController, WellcomeDisplayLogic
{
    var interactor: WellcomeBusinessLogic?
    var router: (NSObjectProtocol & WellcomeRoutingLogic & WellcomeDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // UI Elements
    var backGroudImage:UIImageView!
    var backGroundView:UIView!
    var spotifyImageView:UIImageView!
    var spotifyLabel:UILabel!
    var signUpButton:UIButton!
    var mobileSignUpButton:UIButton!
    var googleSignUpButton:UIButton!
    var appleSignUpButton:UIButton!
    var logInButton:UIButton!
    
    
    
    func addBackgroundImage(){
        backGroudImage = UIImageView(frame: .zero)
        backGroudImage.image = UIImage(named: "bg")
        view.addSubview(backGroudImage)
        
        backGroudImage.translatesAutoresizingMaskIntoConstraints = false
        
       backGroudImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backGroudImage.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        backGroudImage.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        backGroudImage.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
       backGroudImage.layer.cornerRadius = 40
        backGroudImage.layer.masksToBounds = true
       
        addBackgroundView()
        
        
        }
    func addImages(imageName:String,leftAnchor:CGFloat,topAnchor:CGFloat,width:CGFloat,height:CGFloat){
        
        let imageView = UIImageView(frame: .zero)
        backGroudImage.addSubview(imageView)
        imageView.image = UIImage(named: imageName)
        imageView.layer.opacity = 0.5
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leftAnchor.constraint(equalTo:self.view.leftAnchor,constant: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo:self.view.topAnchor,constant: topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        
    }
    
    
    
    
    func addBackgroundView(){
       backGroundView = UIImageView(frame: .zero)
        //backGroundView.image = UIImage(named: "spotifyLogo")
        backGroudImage.addSubview(backGroundView)
        
       
       
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor ,UIColor.black.cgColor,UIColor.systemGreen.cgColor]

        backGroundView.layer.insertSublayer(gradient, at: 0)
            
        
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        
       backGroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
       backGroundView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        backGroundView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
       backGroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
//       backGroudImage.layer.cornerRadius = 40
       // backGroudImage.layer.masksToBounds = true
        
        
        
    }
    
    
    func addSpotifyImage(){
        spotifyImageView = UIImageView(frame: .zero)
        spotifyImageView.image = UIImage(named: "spotifyLogo")
        backGroundView.addSubview(spotifyImageView)
        
        spotifyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        spotifyImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        spotifyImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        spotifyImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        spotifyImageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 200).isActive = true
        
        spotifyImageView.layer.cornerRadius = 40
        spotifyImageView.layer.masksToBounds = true
        
        
        
    }
    
    
    
    
    func addSpotifyLabel(){
        
        // dates
         var now = Date()
        let dateformat = "dd mm yy"
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = dateformat
        dateformatter.string(from: now)
        
        spotifyLabel = UILabel(frame: CGRect(x: 80, y: 300, width: 250, height: 80))
        spotifyLabel.text = "Millions of Songs\nFree on Spotify"
        spotifyLabel.numberOfLines = 0
        spotifyLabel.textColor = .white
        
        spotifyLabel.font = UIFont.boldSystemFont(ofSize: 30)
        backGroundView.addSubview(spotifyLabel)
        
        spotifyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        spotifyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        spotifyLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        spotifyLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        spotifyLabel.topAnchor.constraint(equalTo: spotifyImageView.bottomAnchor , constant: 30).isActive = true
        
    }
    
    func  addSignUpButton(){
        signUpButton = UIButton(frame: .zero)
        
        signUpButton.backgroundColor = .systemGreen
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.masksToBounds = true
        signUpButton.setTitle("Sign up free", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        backGroundView.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.topAnchor.constraint(equalTo: spotifyLabel.bottomAnchor, constant: 30).isActive = true
        
        
    }
    
    func  addMobileSignUpButton(){
        mobileSignUpButton = UIButton(frame: .zero)
        
        mobileSignUpButton.backgroundColor = .clear
        mobileSignUpButton.layer.cornerRadius = 20
        mobileSignUpButton.layer.masksToBounds = true
        mobileSignUpButton.setTitle("      Sign up with mobile", for: .normal)
        mobileSignUpButton.setTitleColor(.white, for: .normal)
        mobileSignUpButton.layer.borderWidth = 1
        mobileSignUpButton.layer.borderColor = UIColor.white.cgColor
        mobileSignUpButton.setImage(UIImage(systemName: "iphone"), for: .normal)
        mobileSignUpButton.tintColor = .label
        backGroundView.addSubview(mobileSignUpButton)
        
        mobileSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        mobileSignUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mobileSignUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mobileSignUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mobileSignUpButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func  addGoogleSignUpButton(){
        googleSignUpButton = UIButton(frame: .zero)
        
        googleSignUpButton.backgroundColor = .clear
        googleSignUpButton.layer.cornerRadius = 20
        googleSignUpButton.layer.masksToBounds = true
        googleSignUpButton.setTitle("      Continue with google", for: .normal)
        googleSignUpButton.setTitleColor(.white, for: .normal)
        googleSignUpButton.layer.borderWidth = 1
        googleSignUpButton.layer.borderColor = UIColor.white.cgColor
        googleSignUpButton.setImage(UIImage(named: "google"), for: .normal)
        googleSignUpButton.tintColor = .label
        backGroundView.addSubview(googleSignUpButton)
        
        googleSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleSignUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        googleSignUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleSignUpButton.topAnchor.constraint(equalTo: mobileSignUpButton.bottomAnchor, constant: 10).isActive = true
        
    }
    
    
    func  addAppleSignUpButton(){
        appleSignUpButton = UIButton(frame: .zero)
        
        appleSignUpButton.backgroundColor = .clear
        appleSignUpButton.layer.cornerRadius = 20
        appleSignUpButton.layer.masksToBounds = true
        appleSignUpButton.setTitle("      Continue with google", for: .normal)
        appleSignUpButton.setTitleColor(.white, for: .normal)
        appleSignUpButton.layer.borderWidth = 1
        appleSignUpButton.layer.borderColor = UIColor.white.cgColor
        appleSignUpButton.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        appleSignUpButton.tintColor = .label
        appleSignUpButton.tintColor = .label
        backGroundView.addSubview(appleSignUpButton)
        
        appleSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        appleSignUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        appleSignUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        appleSignUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        appleSignUpButton.topAnchor.constraint(equalTo: googleSignUpButton.bottomAnchor, constant: 10).isActive = true
        
    }
    
    
    func  addLogInButton(){
        logInButton = UIButton(frame: .zero)
        
        logInButton.backgroundColor = .clear
//        logInButton.layer.cornerRadius = 20
//        logInButton.layer.masksToBounds = true
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        //logInButton.layer.borderWidth = 1
        //logInButton.layer.borderColor = UIColor.black.cgColor
      
//        logInButton.tintColor = .label
//        logInButton.tintColor = .label
        self.view.addSubview(logInButton)
        
        logInButton.addTarget(self, action: #selector(tabLogInButton(sender:)), for: .touchUpInside)
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        logInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logInButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logInButton.topAnchor.constraint(equalTo: appleSignUpButton.bottomAnchor, constant: 50).isActive = true
        
    }
    
    
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = WellcomeInteractor()
        let presenter = WellcomePresenter()
        let router = WellcomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    func configureSelfView (){
        addBackgroundImage()
        addSpotifyImage()
        addSpotifyLabel()
        addSignUpButton()
        addMobileSignUpButton()
        addGoogleSignUpButton()
        addAppleSignUpButton()
        addLogInButton()
    }
    
    private func userSinedIn(success:Bool){
        
    }
    
    @objc func tabLogInButton(sender:UIButton){
        let vc = AuthViewController()
        vc.compleationHandler = {[weak self] success in
            DispatchQueue.main.async {
                self?.userSinedIn(success: success)
            }
            }
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen.withAlphaComponent(0.7)
        title = "Spotify"
        self.configureSelfView()
        
       
        
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Wellcome.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Wellcome.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}