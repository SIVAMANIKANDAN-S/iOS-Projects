//
//  DataBaseManager.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 24/11/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine


class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let db = Firestore.firestore()
    let userPath : String = "users"
    
    
    func collectionUsers(add user:User) -> AnyPublisher<Bool,Error> {
        let twitteUser = TwitterUser (from: user)
        return db.collection(userPath).document(twitteUser.id).setData(from: twitteUser)
            .map { _ in
                return true
                }
            .eraseToAnyPublisher()
        
    }
    
    func retriveUser(from id : String) -> AnyPublisher<TwitterUser , Error> {
        db.collection(userPath).document(id).getDocument()
            .tryMap{ try $0.data(as:TwitterUser.self)
                }
            .eraseToAnyPublisher()
    }
    
    func updateUserFiels(updateFiels : [String : Any] ,  id : String) -> AnyPublisher<Bool , Error> {
        db.collection(userPath).document(id).updateData(updateFiels)
            .map { _ in true
                 }
            .eraseToAnyPublisher()
    }
        
    
}
