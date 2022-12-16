//
//  FollowViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//


import UIKit

class FollowViewController: UIViewController {
    
    var followTableView : UITableView!
    
    func configureFollowTableView(){
        
        followTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(followTableView)
        self.followTableView.delegate = self
        self.followTableView.dataSource = self
        
        self.followTableView.register(FollowTableViewCell.self, forCellReuseIdentifier: "followcell")
        self.followTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let followTableViewConstraints = [followTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),followTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),followTableView.topAnchor.constraint(equalTo:self.view.topAnchor),followTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(followTableViewConstraints)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}



extension FollowViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "followcell", for: indexPath) as! FollowTableViewCell
        return cell
    }
    
    
}

