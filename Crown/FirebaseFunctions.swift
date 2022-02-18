//
//  FirebaseFunctions.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import Foundation
import FirebaseAuth
 
struct FirebaseFunctions{
    
    static func authenticate(email: String, password: String, completion: @escaping (Bool) ->()){
        
        Auth.auth().createUser(withEmail: email, password: password){user, error in
            if let _ = user{
                print("user created")
                completion(true)
                return
            }
            else{
                print(error.debugDescription)
                completion(false)
                return
            }
        }
    }
    static func login(email: String, password: String, completion: @escaping(Bool) ->()){
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _ = user{
                print("logged in")
                completion(true)
            }
            else{
                print(error.debugDescription)
                completion(false)
            }
        }
    }
    
    static func forgotPassword(email: String,
                               completion: @escaping (Bool) -> ()){
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            if let err = error{
                print("failed to send")
                print(err.localizedDescription)
                completion(false)
            }
            else{
                completion(true)
            }
        }
    }
}
 
 

