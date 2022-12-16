//
//  TweetViewController.swift
//  Tweeter
//
//  Created by zs-mac-3 on 14/12/22.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class TweetViewController: UIViewController {
    
    let databaseReferance = Database.database().reference()
    var logedInuserUid : String?
    var imagePicker = UIImagePickerController()
    
    private let tweetButton : UIButton = {
        
        let tweetButton  = UIButton(type:.system)
        tweetButton.setTitle("Tweet", for: .normal)
        tweetButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
       
        tweetButton.backgroundColor = .systemBlue
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        tweetButton.layer.cornerRadius = 17.5
        tweetButton.layer.masksToBounds = true
        tweetButton.tintColor = .white
        return tweetButton
        
    }()
    
    private let dismissButton : UIButton = {
        
        let dismissButton  = UIButton(type:.system)
        dismissButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        dismissButton.backgroundColor = .clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.tintColor = .label
        return dismissButton
        
    }()
    
    private let profileImage : UIImageView = {
        let profileImage = UIImageView()
        profileImage.layer.cornerRadius = 25
        profileImage.layer.masksToBounds = true
        profileImage.image = UIImage(systemName: "person")
        profileImage.contentMode = .scaleAspectFill
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        return profileImage
    }()
    
    private let accesButton : UIButton = {
        
        let accessButton  = UIButton(type:.system)
        accessButton.setTitle("Public", for: .normal)
        accessButton.setTitleColor(.systemBlue, for: .normal)
        accessButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .thin)
        accessButton.isEnabled = false
        accessButton.backgroundColor = .systemBackground
        accessButton.layer.borderWidth = 0.5
        accessButton.layer.borderColor = UIColor.systemBlue.cgColor
        accessButton.translatesAutoresizingMaskIntoConstraints = false
        accessButton.layer.cornerRadius = 17.5
        accessButton.layer.masksToBounds = true
        return accessButton
        
    }()
    
    private let tweetTextView : UITextView = {
        let tweetView = UITextView()
        tweetView.text = "What's happening?"
        tweetView.font = .systemFont(ofSize: 20, weight: .regular)
        tweetView.textColor = .gray
        tweetView.backgroundColor = .systemBackground
        tweetView.translatesAutoresizingMaskIntoConstraints = false
        return tweetView
        
        
    }()
    
    private let imageSelectButton  : UIButton = {
        
        let imageSelectButton  = UIButton(type:.system)
        imageSelectButton.setImage(UIImage(systemName: "camera"), for: .normal)
        imageSelectButton.contentMode = .scaleAspectFill
        imageSelectButton.backgroundColor = .white
        imageSelectButton.layer.borderColor = UIColor.tintColor.cgColor
        imageSelectButton.layer.borderWidth = 2
        imageSelectButton.layer.cornerRadius = 10
        imageSelectButton.layer.masksToBounds = true
        imageSelectButton.translatesAutoresizingMaskIntoConstraints = false
        imageSelectButton.tintColor = .systemBlue
        imageSelectButton.isHidden = true
        return imageSelectButton
    }()
    
    
    
    func configureConstraints(){
        
        // Tweet Button
        
        tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tweetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tweetButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tweetButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // dismissButton
        
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo:tweetButton.centerYAnchor).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        // profile Image

        profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // tweetView

        tweetTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        tweetTextView.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 20).isActive = true
        tweetTextView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        tweetTextView.heightAnchor.constraint(equalToConstant: self.view.frame.height -  300).isActive = true

        // accesButton

        accesButton.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20).isActive = true
        accesButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        accesButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        accesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // imageSelectButton
        
        imageSelectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        imageSelectButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageSelectButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor,constant: -20).isActive = true
        imageSelectButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        

        
        
        
        
    }
    
    @objc func didTapTweetButton(sender : UIButton) {
        if (tweetTextView.textColor == UIColor.label) && tweetTextView.text.count > 0  {
            let key = databaseReferance.child("myTweets").childByAutoId().key
            
            guard let userId = self.logedInuserUid , let key = key else {return }
            
          //  let childUpdates = ["name":tweetTextView.text]
           let childUpdates = ["tweets/\(userId)/\(String(describing: key))/text ": tweetTextView.text ?? "slsk","tweets/\(userId)/\(String(describing: key))/timestamp ": "\(NSDate().timeIntervalSince1970)"] as [String : Any]
           // databaseReferance.child("tweets/\(userId)/\(String(describing: key))/text").setValue(childUpdates)
            databaseReferance.updateChildValues(childUpdates)
            dismiss(animated: true)
        }
        dismiss(animated: true)
       
    }
    
    @objc func didTapDismisButton(){
        dismiss(animated: true)
    }
    
    @objc func didTapImageSelectorButton(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .savedPhotosAlbum
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tweetButton)
        self.view.addSubview(dismissButton)
        self.view.addSubview(profileImage)
        self.view.addSubview(accesButton)
        self.view.addSubview(tweetTextView)
        self.view.addSubview(imageSelectButton)
        configureConstraints()
        self.logedInuserUid = Auth.auth().currentUser?.uid
        tweetTextView.delegate = self
        tweetTextView.textContainerInset = UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        
        tweetButton.addTarget(self, action: #selector(didTapTweetButton(sender:)), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(didTapDismisButton), for: .touchUpInside)
        imageSelectButton.addTarget(self, action: #selector(didTapImageSelectorButton), for:.touchUpInside)
        
    }
    
    
   
    
    
   
    

}

extension TweetViewController : UITextViewDelegate , UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .label
        self.imageSelectButton.isHidden = false
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening?"
            textView.textColor = .gray
        }
        
    }
    
}


extension TweetViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var attributedString = NSMutableAttributedString()
        
        if tweetTextView.text.count > 0 {
            attributedString = NSMutableAttributedString(string: self.tweetTextView.text)
        }
        else {
            attributedString = NSMutableAttributedString(string: "Whats happenig?\n")
        }
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
       
        let selectedImageWidth = textAttachment.image!.size.width
        
        let imageNewWidth = selectedImageWidth / (tweetTextView.frame.size.width - 50)
        
        textAttachment.image = UIImage(cgImage: textAttachment.image!.cgImage!, scale: imageNewWidth, orientation: .down)
        
        let stringWidthImage = NSAttributedString(attachment: textAttachment)
        attributedString.append(stringWidthImage)
        self.tweetTextView.attributedText = attributedString
        dismiss(animated: true)
    }
    
    
}

extension TweetViewController :  UINavigationControllerDelegate {
    
}
