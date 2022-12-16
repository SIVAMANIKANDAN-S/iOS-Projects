//
//  AuthManager.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 22/11/22.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine

class AuthManager {
    static let shared = AuthManager()
    
    func register(with email:String , password : String) -> AnyPublisher<User,Error> {
        return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
    
    func login(with email:String , password : String) -> AnyPublisher<User,Error> {
        return Auth.auth().signIn(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
