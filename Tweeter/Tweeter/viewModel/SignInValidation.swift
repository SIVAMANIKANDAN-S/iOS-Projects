//
//  AuthManager.swift
//  TwitterClone
//
//  Created by zs-mac-3 on 21/11/22.
//

import Foundation
import Firebase
import Combine

final class SignInValidation : ObservableObject {
    
    @Published var email : String?
    @Published var password : String?
    @Published var isRegisterationFormValid : Bool = false
    @Published var user : User?
    @Published var error : String?
    
    private var subscrpitons : Set<AnyCancellable> = []
    
    func validateRegisterationform (){
        guard let email = self.email ,
              let password = self.password else{
            isRegisterationFormValid = false
            return
        }
        isRegisterationFormValid = ( isValidEmail(email: email) && password.count >= 8 )
        
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email ,
              let password = password else{return}
        AuthManager.shared.register(with: email, password: password)
            .handleEvents(receiveOutput: { [weak self] user in
                self?.user = user
            } )
            .sink {[weak self] completion in
                if case .failure(let error) = completion{
                    self?.error = error.localizedDescription
                }
                
            } receiveValue: { [weak self] user in
                self?.createdUserRecord(for : user)
            }
            .store(in: &subscrpitons)
        
        
    }
    
    func loginUser() {
        guard let email = email ,
              let password = password else{return}
        AuthManager.shared.login(with: email, password: password)
            .sink {[weak self] completion in
                if case .failure(let error) = completion{
                    self?.error = error.localizedDescription
                    
                }
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscrpitons)
        
        
    }
    
    func createdUserRecord(for user:User) {
        DatabaseManager.shared.collectionUsers(add: user)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { state in
                print("UserData Added to Database : \(state)")
            }
            .store(in: &subscrpitons)

    }
    
}
