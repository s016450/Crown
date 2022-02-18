//
//  HomeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI
 
struct HomeView: View {
    
    @EnvironmentObject var userInfo: UserInfo
 
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 16){
 
            Button(action: {}, label: {
                Image(systemName: "person.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.Gray)
                    .clipShape(Circle())
                    .shadow(color: Color.Purple.opacity(0.6), radius: 5, x: 0, y: 0)
            })
            Spacer()
            VStack(alignment: .leading,
                   spacing: 16){
                
                
            }
                ButtonView(title: "Sign Out"){
                    userInfo.loggedIn = false
                }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main Content View")
    }
}
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}

