//
//  AccountView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/9/22.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        NavigationView{
            VStack{
                ButtonView(title: "Sign Out"){
                    userInfo.email = ""
                    userInfo.password = ""
                    userInfo.confirmPassword = ""
                    userInfo.loggedIn = false
                }
            }
            .padding(.horizontal, 15)
        }
        .ignoresSafeArea()
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
