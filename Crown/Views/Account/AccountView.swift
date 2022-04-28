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
                VStack{
                    Text("Account")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(Color.Gray)
                        .padding(.top, 30)
                    Spacer()
                }
                VStack(spacing: 5){
                    Text("Email: \(userInfo.email)")
                        .foregroundColor(Color.Gray)
                        .font(.system(size: 20, weight: .bold))
                    Text("Competitions Created: \(userInfo.ownCompetitions.count)")
                        .foregroundColor(Color.Gray)
                        .font(.system(size: 20, weight: .bold))
                    Text("Competitions Joined: \(userInfo.joinedCompetitions.count)")
                        .foregroundColor(Color.Gray)
                        .font(.system(size: 20, weight: .bold))
                    Text("Crowns Earned: \(userInfo.crowns.count)")
                        .foregroundColor(Color.Gray)
                        .font(.system(size: 20, weight: .bold))
                    
                    
                }
                VStack{
                    Spacer()
                    ButtonView(title: "Sign Out"){
                        userInfo.email = ""
                        userInfo.password = ""
                        userInfo.confirmPassword = ""
                        userInfo.loggedIn = false
                    }
                    .padding(.bottom, 17)
                }
                .padding(.horizontal, 15)
            }
            .ignoresSafeArea()
        }
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
