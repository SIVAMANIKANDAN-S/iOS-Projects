//
//  HomeInteractor.swift
//  Tweeter
//


import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase


protocol HomeBusinessLogic : AnyObject{
    func fetchTweets()
    func fetchUser()
    
}



class HomeIntractor : HomeBusinessLogic {
    var presentor : HomePresentationLogic!
  
    var currentUserId = Auth.auth().currentUser?.uid
    var database = Database.database().reference()
    var tweets : [String:[String:String]]!
    
    
    
    func fetchUser() {
           
        
        guard currentUserId != nil else{return}
            
        Firestore.firestore().collection("users").document(currentUserId!).getDocument { snapshot, error in
                if error != nil {
                                }
                else {
                    guard snapshot != nil else{return}
                    print(snapshot)
                }
            }
        }
    
    func fetchTweets(){
//        database.child("tweets").child(currentUserId!).observeSingleEvent(of: .value, with: { snapshot in
//
//            let values = snapshot.value as? [String : [String : String]]
//
//            guard let tweets = values else { return }
//            self.presentor.presentGotValuseToVC(data:tweets)
//
//          }) { error in
//          print(error.localizedDescription)
//        }
//
        guard let userId = currentUserId else {return}
         database.child("tweets").child(userId).observe(.value) {
            snapshot   in
            
            
            guard let value = snapshot.value as?  [String : [String : String]]
            else{
                return
            }
            
            self.presentor.presentGotValuseToVC(data: value)
             print(value)
            
        }
        
        
    }
}


