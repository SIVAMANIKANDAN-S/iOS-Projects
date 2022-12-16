//
//  UserDetailse.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 29/11/22.
//

import Foundation
import FirebaseAuth
import Combine

final class UserDetailes{
    
    @Published var user : TwitterUser?
    @Published var error : String?
    
    private var subscription : Set<AnyCancellable> = []
    
    
    func retriveUser(){
        guard let id = Auth.auth().currentUser?.uid else{return}
        DatabaseManager.shared.retriveUser(from: id)
            .sink { [weak self] completion in
                if case .failure (let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }.store(in: &subscription)

    }
}
