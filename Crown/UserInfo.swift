//
//  UserInfo.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import Foundation
 
class UserInfo: ObservableObject{
    var email: String
    var name: String
    var password: String
    var confirmPassword: String = ""
    @Published var loggedIn: Bool

    init(email: String = "", name: String = "", loggedIn: Bool = false){
        
        self.email = email
        self.name = name 
        self.password = ""
        self.loggedIn = loggedIn
    }
}
 
func clear(UserInfo: UserInfo){
    UserInfo.email = ""
    UserInfo.name = ""
    UserInfo.password = ""
    UserInfo.confirmPassword = ""
}

