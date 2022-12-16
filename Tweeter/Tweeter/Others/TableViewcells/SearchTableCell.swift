//
//  SearchTableCell.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.


import UIKit

class SearchTableCell: UITableViewCell {
    
    let reuseID = "searchCell"
    
    var profileImage: UIImageView = {
    let profioleImage = UIImageView(frame: .zero)
    profioleImage.image = UIImage(named: "mj")
    profioleImage.layer.cornerRadius = 25
    profioleImage.layer.masksToBounds = true
    profioleImage.clipsToBounds = true
    profioleImage.backgroundColor = UIColor.white
    profioleImage.translatesAutoresizingMaskIntoConstraints = false
    
    return profioleImage
}()
    
    
    var displayName :UILabel = {
    let displayName = UILabel(frame: .zero)
    displayName.translatesAutoresizingMaskIntoConstraints = false
    //displayName.textColor = .secondaryLabel
    displayName.backgroundColor = .clear
    displayName.font = .systemFont(ofSize: 20, weight: .bold)
    displayName.text = "Slsk"
    return displayName
}()


    var userName :UILabel = {
    let userName = UILabel(frame: .zero)
    userName.translatesAutoresizingMaskIntoConstraints = false
    userName.textColor = .darkGray
    userName.backgroundColor = .clear
    userName.font = .systemFont(ofSize: 15, weight: .regular)
    userName.text = "@mJ"
    return userName
}()
    
    
    func configureConstraints(){
        
        let profileImageConstraint = [profileImage.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 20),profileImage.centerYAnchor.constraint(equalTo: centerYAnchor),profileImage.widthAnchor.constraint(equalToConstant: 50),profileImage.heightAnchor.constraint(equalToConstant: 50)]
        
        let displayNameConstraint = [displayName.leftAnchor.constraint(equalTo: profileImage.rightAnchor , constant: 15),displayName.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),displayName.widthAnchor.constraint(lessThanOrEqualToConstant: 150),displayName.heightAnchor.constraint(equalToConstant: 30)]

       

        let userNameLableConstraint = [userName.leftAnchor.constraint(equalTo: displayName.leftAnchor),userName.topAnchor.constraint(equalTo: displayName.bottomAnchor),userName.widthAnchor.constraint(equalToConstant: 150),userName.heightAnchor.constraint(equalToConstant: 30),userName.bottomAnchor.constraint(equalTo:bottomAnchor,constant: -20)]
        
        NSLayoutConstraint.activate(profileImageConstraint)
        NSLayoutConstraint.activate(displayNameConstraint)
        NSLayoutConstraint.activate(userNameLableConstraint)
       
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profileImage)
        contentView.addSubview(displayName)
        contentView.addSubview(userName)
        configureConstraints()
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
