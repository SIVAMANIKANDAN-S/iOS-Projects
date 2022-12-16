//
//  ProfileDataViewModel.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 24/11/22.
//

import Foundation
import Combine
import UIKit
import FirebaseAuth
import FirebaseStorage


final class UserProfileData : ObservableObject {
    
    private var subscriptions: Set<AnyCancellable> = []
   
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var profilePath: String?
    @Published var imageData: UIImage?
    @Published var isFormValid: Bool = false
    @Published var error: String = ""
    @Published var isOnboarding : Bool  = false
    
    
    func validateUserProfileForm() {
        guard let displayName = displayName,
              displayName.count > 2,
              let username = username,
              username.count > 2,
              let bio = bio,
              bio.count > 2,
              imageData != nil else {
            isFormValid = false
            return
        }
        isFormValid = true
    }
    
    
    func uploadProfile() {
        let randomID = UUID().uuidString
        guard let imageData = imageData?.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        StorageManager.shared.uploadProfilePhoto(with: randomID, image: imageData, metaData: metaData)
            .flatMap({ metaData in
                StorageManager.shared.getDownloadURL(for: metaData.path)
            })
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.error = error.localizedDescription
                    
                case .finished:
                    self?.uploadUserData()
                }
            } receiveValue: { [weak self] url in
                self?.profilePath = url.absoluteString
            }
            .store(in: &subscriptions)
        
        
    }
    
    private func uploadUserData(){
        guard let displayName,
              let username,
              let bio,
              let profilePath,
              let id = Auth.auth().currentUser?.uid else {return}
        
        let updateFeilds : [String : Any]  = [
            "displayName" : displayName,
            "userName" : username ,
            "bio" : bio,
            "profilePath" : profilePath,
            "id"  : id,
            "isUserOnBoarded" : true
            
        ]
        
        DatabaseManager.shared.updateUserFiels(updateFiels: updateFeilds, id: id)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] updated in
                self?.isOnboarding = updated
            }.store(in: &subscriptions) 

        
    }
    
    
}
