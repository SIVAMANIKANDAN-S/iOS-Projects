//
//  SearchTableViewCell.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var displayName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
