//
//  ViewController.swift
//  ABCPattern
//
//  Created by zs-mac-3 on 15/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var characterField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        showButton.addTarget(self, action: #selector(didTapShowPatternButton), for: .touchUpInside)
    }
    
    
    @objc func didTapShowPatternButton(){
        guard self.characterField.text?.count == 1 else{return}
        let character = self.characterField.text!.uppercased()
        
        var columns = Int( ( Character(character).asciiValue!)-64 )
        let rows = Int(((( Character(character).asciiValue!)-64)*2)-1)
        var collumnCount = -1
        var resultString : String = ""
        for i in 0..<rows{
            for j in 0..<columns{
                resultString = resultString+"\(UnicodeScalar(65+j)!)"
            }
            resultString=resultString+"\n"
            columns = columns+collumnCount
            if(i == (rows/2)-1){
                resultString = resultString+"A\n"
                collumnCount = 1
            }
        }
        DispatchQueue.main.async {
            self.showLabel.text = resultString
        }
        
    }
    
    
}

