//
//  ProfileViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.

import UIKit
import Combine
import SDWebImage

class ProfileViewController: UIViewController {
    
    private let userData = UserDetailes()
    
    private lazy var profileIHeaderView =  ProfileIHeaderView(frame: CGRect(x: 0, y: 0, width: myTweetsTableView.frame.width, height: 320))
    
    private var subscriptions : Set<AnyCancellable> = []
    
    private let statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        //view.layer.opacity = 0
        return view
    }()
    
    func statusBarCostraint(){
        
        statusBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        statusBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        statusBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        statusBar.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 : 20 ).isActive = true
        
    }
    
    private let myTweetsTableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(TimeLineTableViewCell.self, forCellReuseIdentifier: TimeLineTableViewCell.timeLineCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    
    
    func tweetTableViewConstraint(){
        let tweetTableViewConstraints = [myTweetsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),myTweetsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),myTweetsTableView.topAnchor.constraint(equalTo:self.view.topAnchor),myTweetsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(tweetTableViewConstraints)
    }
    
    private func bindViews(){
        
        userData.$user.sink { [weak self]  user in
            
            guard let user = user else {return}
            
            self?.profileIHeaderView.displayName.text = user.displayName
            
            self?.profileIHeaderView.userName.text = "@\(user.userName)"
            self?.profileIHeaderView.followingCountLabel.text = "\(user.followingCount)"
            self?.profileIHeaderView.followersCountLabel.text = "\(user.followersCount)"
            self?.profileIHeaderView.userJoinedDate.text = user.bio
            self?.profileIHeaderView.profileImage.sd_setImage(with: URL(string: user.profilePath))
            
        }.store(in: &subscriptions)
        
        
        
    }
    
    @objc func editProfile(){
        let userDetaileVC = EditProfileViewController()
        
        present(userDetaileVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userData.retriveUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "Profile"
        navigationController?.navigationBar.tintColor = .label
        self.view.backgroundColor = .systemGray5
        
        //        self.view.addSubview(statusBar)
        //        statusBarCostraint()
        self.view.addSubview(myTweetsTableView)
        tweetTableViewConstraint()
        
        
        // NSLayoutConstraint.activate([tweetHeaderView.leadingAnchor.constraint(equalTo: cel)])
        profileIHeaderView.followButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        myTweetsTableView.tableHeaderView = profileIHeaderView
        
        myTweetsTableView.delegate = self
        myTweetsTableView.dataSource = self
        bindViews()
    }
    
    
    
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTweetTableCell = tableView.dequeueReusableCell(withIdentifier:TimeLineTableViewCell.timeLineCellIdentifier, for: indexPath) as! TimeLineTableViewCell
        return myTweetTableCell
    }
    
    
}
