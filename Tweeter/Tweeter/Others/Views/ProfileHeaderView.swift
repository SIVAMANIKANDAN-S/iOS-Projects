//
//  ProfileHeaderView.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//
//


import UIKit

class ProfileIHeaderView: UIView {
    // profileHeaderImage
    var profileHeaderImage : UIImageView = {
        let profileBackgroundImage = UIImageView(frame: .zero)
        profileBackgroundImage.image = UIImage(named: "bg")
        profileBackgroundImage.clipsToBounds = true
        profileBackgroundImage.contentMode = .scaleAspectFill
        profileBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        return profileBackgroundImage
    }()
    
    
    //profileHeaderImageConstraint
    
    func profileHeaderIamgeConstraintImage(){
        let profileBackgroundImageConstraint = [profileHeaderImage.leadingAnchor.constraint(equalTo: leadingAnchor),profileHeaderImage.trailingAnchor.constraint(equalTo: trailingAnchor),profileHeaderImage.topAnchor.constraint(equalTo: topAnchor),profileHeaderImage.heightAnchor.constraint(equalToConstant: 100)]
        
        NSLayoutConstraint.activate(profileBackgroundImageConstraint)
        
    }
    
    
    var profileImage : UIImageView = {
        let profileImage = UIImageView(frame:.zero)
        //profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
        profileImage.clipsToBounds = true
        profileImage.image = UIImage(named: "mj")
        profileImage.layer.borderWidth = 4
        profileImage.layer.borderColor = UIColor.systemBackground.cgColor
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.backgroundColor = .yellow
        return profileImage
    }()
    
    
    
    // displayName
    var displayName : UILabel  = {
        let displayName = UILabel(frame: .zero)
        
        //displayName.textColor = .secondaryLabel
        displayName.backgroundColor = .clear
        displayName.translatesAutoresizingMaskIntoConstraints = false
        displayName.font = .systemFont(ofSize: 20, weight: .bold)
        
        return displayName
    }()
    
    func displayNameConstraint(){
        let displayNameConstrint = [displayName.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),displayName.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 5)]
        
        NSLayoutConstraint.activate(displayNameConstrint)
    }
    
    var followButton : UIButton  = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.setTitle("Edit profile", for: .normal)
        button.setImage(UIImage(systemName:"square.and.pencil"), for: .normal)
        button.imageView?.tintColor  = .white
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // followButton
    
    func followButtonConstraint(){
        
        let followbuttonConstraint = [followButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),followButton.topAnchor.constraint(equalTo: profileHeaderImage.bottomAnchor,constant: 10),followButton.heightAnchor.constraint(equalToConstant: 30),followButton.widthAnchor.constraint(equalToConstant: 150)]
        NSLayoutConstraint.activate(followbuttonConstraint)
        
    }
    
    var userName : UILabel = {
        let userName  = UILabel()
        userName.textColor = .systemGray2
        userName.font  = UIFont.systemFont(ofSize: 15, weight: .regular)
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        return userName
    }()
    
    func userNameConstraints(){
        let userNameConstraints = [userName.leadingAnchor.constraint(equalTo: displayName.leadingAnchor),userName.topAnchor.constraint(equalTo: displayName.bottomAnchor,constant: 5)]
        NSLayoutConstraint.activate(userNameConstraints)
    }
    
    var userBioLable : UILabel = {
        let userBioLable  = UILabel()
        
        //userBioLable.textColor = .secondaryLabel
        userBioLable.font  = UIFont.systemFont(ofSize: 20, weight: .regular)
        userBioLable.numberOfLines = 0
        userBioLable.translatesAutoresizingMaskIntoConstraints = false
        
        return userBioLable
    }()
    
    //userBioLable
    
    func userBioLableConstraints(){
        let userNameConstraints = [userBioLable.leadingAnchor.constraint(equalTo: displayName.leadingAnchor),userBioLable.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 5),userBioLable.trailingAnchor.constraint(equalTo:trailingAnchor,constant: -60)]
        NSLayoutConstraint.activate(userNameConstraints)
    }
    
    func profileImageConstraints(){
        let profileImageConstraint = [profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),profileImage.centerYAnchor.constraint(equalTo: profileHeaderImage.bottomAnchor,constant: 5),profileImage.widthAnchor.constraint(equalToConstant: 60),profileImage.heightAnchor.constraint(equalToConstant: 60)]
        
        NSLayoutConstraint.activate(profileImageConstraint)
    }
    
    // user joined date
    
    private let userjoinedDateImage : UIImageView = {
        let userJoinedDateImage = UIImageView(frame:.zero)
        
        userJoinedDateImage.layer.masksToBounds = true
        userJoinedDateImage.clipsToBounds = true
        userJoinedDateImage.image = UIImage(systemName: "calendar")
        userJoinedDateImage.translatesAutoresizingMaskIntoConstraints = false
        userJoinedDateImage.backgroundColor = .systemBackground
        userJoinedDateImage.tintColor = .systemGray2
        return userJoinedDateImage
    }()
    
    func userJoinedDateImageConstraints(){
        let userJoinedLableConstraint = [userjoinedDateImage.leadingAnchor.constraint(equalTo: userBioLable.leadingAnchor),userjoinedDateImage.topAnchor.constraint(equalTo: userBioLable.bottomAnchor,constant: 5)]
        NSLayoutConstraint.activate(userJoinedLableConstraint)
    }
    
    var userJoinedDate : UILabel = {
        let userJoinedDateLable  = UILabel()
        userJoinedDateLable.textColor = .systemGray2
        userJoinedDateLable.font  = UIFont.systemFont(ofSize: 15, weight: .regular)
        userJoinedDateLable.translatesAutoresizingMaskIntoConstraints = false
        
        return userJoinedDateLable
        
    }()
    func userJoinedDateLableConstraints(){
        let userJoinedLableConstraint = [userJoinedDate.leadingAnchor.constraint(equalTo: userjoinedDateImage.trailingAnchor,constant: 5),userJoinedDate.topAnchor.constraint(equalTo: userBioLable.bottomAnchor,constant: 5)]
        NSLayoutConstraint.activate(userJoinedLableConstraint)
    }
    
    // profile Section Tab enumeration
    
    private enum sectionTaButtons : String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets And Replies"
        case media = "Media"
        case likes = "Likes"
        
        var selectedindex : Int {
            switch self{
            case .tweets :
                return 0
            case .tweetsAndReplies :
                return 1
            case .media :
                return 2
            case .likes :
                return 3
            }
        }
        
    }
    
    private var indiacatorView : UIView = {
        let indicator = UIView()
        indicator.backgroundColor = .systemBlue
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var indicatorLeadingAnchorConstraint : [NSLayoutConstraint] = []
    var indicatorTrailingAnchorConstraint : [NSLayoutConstraint] = []
    
    func setIndicatorConstraint(){
        for i in 0..<profileTabs.count {
            indicatorLeadingAnchorConstraint.append(indiacatorView.leadingAnchor.constraint(equalTo: sectionStackView.arrangedSubviews[i].leadingAnchor))
            indicatorTrailingAnchorConstraint.append(indiacatorView.trailingAnchor.constraint(equalTo: sectionStackView.arrangedSubviews[i].trailingAnchor))
            
        }
    }
    
    func indicatorViewConstraints(){
        NSLayoutConstraint.activate([ indicatorLeadingAnchorConstraint[0],indicatorTrailingAnchorConstraint[0],indiacatorView.topAnchor.constraint(equalTo: profileTabs[0].bottomAnchor),indiacatorView.heightAnchor.constraint(equalToConstant: 4)])
    }
    
    private var selectedLable : Int = 0 {
        didSet{
            for i in 0..<profileTabs.count{
                UIView.animate(withDuration: 0.5, delay: 0,options: .curveEaseOut) {[weak self] in
                    
                    self?.sectionStackView.arrangedSubviews[i].tintColor = i == self?.selectedLable ? .label : .secondaryLabel
                    self?.indicatorTrailingAnchorConstraint[i].isActive = i == self?.selectedLable ? true : false
                    self?.indicatorLeadingAnchorConstraint[i].isActive = i == self?.selectedLable ? true : false
                    self?.layoutIfNeeded()
                }completion: { _ in
                    
                }
            }
        }
    }
    
    private var profileTabs : [UIButton] = ["Tweets","Tweets And Replies","Media","Likes"].map { buttonTitle in
        let tabButton = UIButton(type: .system)
        tabButton.setTitle(buttonTitle, for: .normal)
        tabButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        tabButton.translatesAutoresizingMaskIntoConstraints = false
        tabButton.tintColor = .label
        return tabButton
    }
    
    private lazy var sectionStackView : UIStackView = {
        let sectionStackView = UIStackView(arrangedSubviews: profileTabs)
        sectionStackView.distribution = .equalSpacing
        sectionStackView.alignment = .center
        sectionStackView.translatesAutoresizingMaskIntoConstraints = false
        sectionStackView.axis = .horizontal
        return sectionStackView
    }()
    
    func profileStackViewConstraints(){
        
        sectionStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
        sectionStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        sectionStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
    }
    
    @objc func didTapSectionTab(sender:UIButton){
        
        guard let lable = sender.titleLabel?.text else {return}
        
        switch lable {
        case sectionTaButtons.tweets.rawValue:
            selectedLable = 0
        case sectionTaButtons.tweetsAndReplies.rawValue:
            selectedLable = 1
        case sectionTaButtons.media.rawValue:
            selectedLable = 2
        case sectionTaButtons.likes.rawValue:
            selectedLable = 3
        default:
            selectedLable = 0
        }
        
    }
    
    func addSectionButtonTarget(){
        
        
        for(i, button) in sectionStackView.arrangedSubviews.enumerated(){
            guard let button = button as? UIButton else {return}
            if i == selectedLable {
                button.tintColor = .label
            }
            else {
                button.tintColor = .secondaryLabel
            }
            button.addTarget(self, action: #selector(didTapSectionTab(sender:)), for: .touchUpInside)
        }
    }
    
    private let followersTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Followers"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var followersCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let followingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Following"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var followingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    
    
    
    private func configureConstraints() {
        
        
        let followingCountLabelConstraints = [
            followingCountLabel.leadingAnchor.constraint(equalTo: displayName.leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: userJoinedDate.bottomAnchor, constant: 10),
            
            
        ]
        
        let followingTextLabelConstraints = [
            followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor, constant: 4),
            followingTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        let followersCountLabelConstraints = [
            followersCountLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor, constant: 8),
            followersCountLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        let followersTextLabelConstraints = [
            followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
            followersTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(followingCountLabelConstraints)
        NSLayoutConstraint.activate(followingTextLabelConstraints)
        NSLayoutConstraint.activate(followersCountLabelConstraints)
        NSLayoutConstraint.activate(followersTextLabelConstraints)
        
    }
    
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(followersTextLabel)
        addSubview(followingTextLabel)
        addSubview(followersCountLabel)
        addSubview(followingCountLabel)
        
        backgroundColor = .systemBackground
        addSubview(profileHeaderImage)
        profileHeaderIamgeConstraintImage()
        addSubview(profileImage)
        profileImageConstraints()
        addSubview(displayName)
        displayNameConstraint()
        addSubview(followButton)
        followButtonConstraint()
        addSubview(userName)
        userNameConstraints()
        addSubview(userBioLable)
        userBioLableConstraints()
        addSubview(userjoinedDateImage)
        userJoinedDateImageConstraints()
        
        addSubview(userJoinedDate)
        userJoinedDateLableConstraints()
        configureConstraints()
        addSubview(sectionStackView)
        profileStackViewConstraints()
        addSectionButtonTarget()
        addSubview(indiacatorView)
        setIndicatorConstraint()
        indicatorViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
