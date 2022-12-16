//
//  SearchViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//


import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

class SearchViewController: UIViewController {
    
    var searchTableView : UITableView!
    var result = [Dictionary<String,Dictionary<String,String>>]()
    var userArray  = [NSDictionary]()
    var filteredUserArray = [NSDictionary]()
    
    func configureSearchTableView(){
        searchTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(searchTableView)
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        //self.searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchcell")
        self.searchTableView.register(SearchTableCell.self, forCellReuseIdentifier: "searchCell")
        self.searchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tweetTableViewConstraints = [searchTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),searchTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),searchTableView.topAnchor.constraint(equalTo:self.view.topAnchor),searchTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(tweetTableViewConstraints)
        
        
    }
    
    // searchBar
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @objc func dismisSearchView(){
        dismiss(animated: true)
    }
    
    
    // get user from  firebase
    func fetchUser(){
        
        //        Firestore.firestore().collection("users").whereField("bio", isNotEqualTo: "")
        //            .getDocuments() { (querySnapshot, err) in
        //                if let err = err {
        //                    print("Error getting documents: \(err)")
        //                } else {
        //
        //                    guard let document = querySnapshot else {return}
        //                    for reusult in document.documents{
        //                        print(reusult.documentID)
        //                    }
        //                    guard let documents : Array <AnyObject> = querySnapshot?.documents.compactMap({ $0 as AnyObject}) else{return}
        //
        //                    for document in documents {
        //                        print(document)
        //                        print("\(document.documentID) => \(document.data())")
        //                    }
        //                }
        //            }
        
        Firestore.firestore().collection("users").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot else {
                    print("returned")
                    return }
                
                documents.documents.forEach { document in
                   print(document.documentID)
                    
                }
             
            }
        }
    }
    
    func filterdUsers(searchText:String){
        self.filteredUserArray = self.userArray.filter({ user in
            let displayName = user["displayName"] as? String
            return (displayName?.lowercased().contains(searchText.lowercased()))!
        })
        
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Find Tweeters"
        self.view.backgroundColor = .cyan
        fetchUser()
        // self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(dismisSearchView))
        
        configureSearchTableView()
        
        // set searchController
        
        self.searchController.searchResultsUpdater = self.searchTableView
        
        definesPresentationContext = true
        self.searchTableView.tableHeaderView = searchController.searchBar
        
        
        
        
        
    }
    
    
    
    
}

extension SearchViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredUserArray.count
        }
        else{
            return userArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var searchedUser : NSDictionary?
        if searchController.isActive && searchController.searchBar.text != "" {
            searchedUser = self.filteredUserArray[indexPath.row]
        }
        else{
            searchedUser = self.userArray[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableCell
        cell.displayName.text = searchedUser?["displayName"] as? String
        cell.displayName.text = searchedUser?["userName"] as? String
        let profilePath = (searchedUser?["profilePath"] as? String) ?? ""
        cell.profileImage.sd_setImage(with: URL(string: profilePath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    
}


extension SearchViewController : UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        let searchedText = searchController.searchBar.text ?? ""
        self.filterdUsers(searchText: searchedText)
        
    }
    
}

extension UITableView : UISearchResultsUpdating{
    public func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
