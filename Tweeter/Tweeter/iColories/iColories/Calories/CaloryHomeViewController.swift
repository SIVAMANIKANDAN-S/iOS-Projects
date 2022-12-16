//
//  CaloryHomeViewController.swift
//  iColories
//
//  Created by zs-mac-3 on 14/12/22.
//

import UIKit

class CaloryHomeViewController: UIViewController {

    private var caloryTableView : UITableView = {
        let tableview  = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(CaloryTableViewCell.self, forCellReuseIdentifier: "calorycell")
        tableview.backgroundColor = .systemGray
        return tableview
        
    }()
    
    func configureConstraints(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
