//
//  HomeViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage
import Combine

protocol HomeDisplayLogic : AnyObject{
    
    func uopdateTimelineTableview(tweetsData : [Tweets])
    
}




class HomeViewController: UIViewController ,HomeDisplayLogic {
    
    
    var interactor : HomeBusinessLogic!
    
    var database = Database.database().reference()
    var currentUserId = Auth.auth().currentUser?.uid
    
    private let userData = UserDetailes()
    
    func setup(){
        let interactor = HomeIntractor()
        let presentor = HomePresentor()
        self.interactor = interactor
        interactor.presentor = presentor
        presentor.viewController = self
        
    }
    
    private var  viewModel = HomeViewViewModel()
    private var subscription : Set<AnyCancellable> = []
    let navigationItemSize = 35
    
    var currentUser = Auth.auth().currentUser
    var userName = ""
    var displayName = ""
    var profileImage = UIImageView(image: UIImage(named: "mj"))
    
    var tweets = [Tweets]()
    
    
    
    // fetch user detailes from firestore
    
    func fetchUser() {
        
        
        guard let userId = currentUser?.uid  else{return}
        print(userId)
        Firestore.firestore().collection("users").document(userId).getDocument { snapshot, error in
            if error != nil {
            }
            else {
                guard snapshot != nil else{return}
                self.userName = snapshot?.get("userName") as! String
                self.displayName = snapshot?.get("displayName") as! String
                DispatchQueue.main.async {
                    self.profileImage.sd_setImage(with: URL(string: snapshot?.get("profilePath") as! String))
                    
                    var profileImage = self.profileImage.image ?? UIImage(systemName: "person")
                    profileImage = profileImage?.withRenderingMode(.alwaysOriginal)
                    
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .done, target: self, action: #selector(self.didTapProfileImage))
                    self.navigationItem.leftBarButtonItem?.accessibilityFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
                    self.timelintTableView.reloadData()
                }
                
                
            }
        }
    }
    
    func configureNavigationBar(){
        let middleView = UIView(frame: CGRect(x:0, y: 0, width: navigationItemSize, height: navigationItemSize))
        
        //middle twitter logo
        let middleLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: navigationItemSize, height: navigationItemSize))
        middleLogo.contentMode = .scaleAspectFit
        middleLogo.image = UIImage(named: "tweet")
        middleView.addSubview(middleLogo)
        navigationItem.titleView = middleView
    }
    
    
    
    private func signinHandler(){
        if currentUser == nil {
            let authVC = UINavigationController(rootViewController: WelcomeviewController())
            authVC.modalPresentationStyle = .fullScreen
            present(authVC, animated: false)
        }
        // profile logo
        
        
        var profileImage = self.profileImage.image ?? UIImage(systemName: "person")
        profileImage = profileImage?.withRenderingMode(.alwaysOriginal)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSigninButton))
        
        
        
    }
    
    @objc func didTapSigninButton(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            
        }
        signinHandler()
    }
    
    
    // when clicked profile image
    @objc func didTapProfileImage(){
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    
    private let timelintTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TimeLineTableViewCell.self, forCellReuseIdentifier: TimeLineTableViewCell.timeLineCellIdentifier)
        tableView.backgroundColor = .systemBackground
        
        return tableView
    }()
    
    @objc func tweetVC(){
        let tweetVC = UINavigationController(rootViewController: TweetViewController())
        tweetVC.modalPresentationStyle = .fullScreen
        self.present(tweetVC, animated: true)
    }
    
    func configureAIVLoading  (){
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
    }
    
    
    func configureTweetButton (){
        
        
        let button = UIButton(frame: CGRect(x: 250, y: self.view.frame.height - 150 , width: 50, height: 50))
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.addTarget(self, action: #selector(tweetVC), for: .touchUpInside)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.5
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30).isActive = true
    }
    
    //test
    func fetchTweets(){
        self.interactor.fetchTweets()
        
        //        database.child("tweets").child(currentUserId!).observeSingleEvent(of: .value, with: { snapshot in
        //
        //            let values = snapshot.value as? [String : [String : String]]
        //
        //            guard let tweets = values else { return }
        //            //self.presentor.presentGotValuseToVC(data:tweets)
        //            print(tweets)
        //          }) { error in
        //          print(error.localizedDescription)
        //        }
    }
    
    func uopdateTimelineTableview(tweetsData : [Tweets]){
        self.tweets = tweetsData
        self.timelintTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signinHandler()
        setup()
        
        
        self.view.backgroundColor = .systemBackground
        self.title = "Home"
        // TimeLineTAble
        view.addSubview(timelintTableView)
        configureNavigationBar()
        
        timelintTableView.delegate = self
        timelintTableView.dataSource = self
        timelintTableView.rowHeight = UITableView.automaticDimension
        timelintTableView.estimatedRowHeight = 100
        bindView()
        configureTweetButton ()
        fetchUser()
        fetchTweets()
        
        
        // fetchTweets()
        
    }
    
    //    func getTweet(){
    //
    //        HomeIntractor.
    //
    //    }
    //
    
    
    func completeUserLogedIn(){
        let profileDataVC = ProfileDataGettingViewController()
        
        
        //profileDataVC.modalPresentationStyle = .fullScreen
        present(profileDataVC, animated: true)
        
    }
    
    func bindView(){
        viewModel.$user.sink { [weak self] user in
            guard let user = user else{return}
            if !user.isUserOnBoarded {
                self?.completeUserLogedIn()
            }
        }
        .store(in: &subscription)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelintTableView.frame = self.view.frame
        //        timelintTableView.rowHeight = UITableView.automaticDimension
        //        timelintTableView.estimatedRowHeight = 120
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        //fetchUser()
        //viewModel.retriveUser()
    }
    
}





extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timeLineCell = tableView.dequeueReusableCell(withIdentifier: TimeLineTableViewCell.timeLineCellIdentifier, for: indexPath) as! TimeLineTableViewCell
        timeLineCell.displayName.text = self.displayName
        timeLineCell.userName.text = "@\(self.userName)"
        timeLineCell.tweeterImageView.image = self.profileImage.image
        timeLineCell.tweetContent.text = tweets[indexPath.row].text ?? "This is my Tweet"
       
        
        timeLineCell.delegate = self
        
        return timeLineCell
    }
    
    
}


extension HomeViewController : TimeLineTableViewCellDelegate {
    func replyButtonAction() {
        print("replayed")
    }
    
    func likeButtonAction() {
        print("liked")
    }
    
    func retweetButtonAction() {
        print("retweeted")
    }
    
    func shareButtonAction() {
        print("shared")
    }
    
    
}
