//
//  WCDView.swift
//  Crown
//
//  Created by Jonathan  Miller  on 4/28/22.
//

import SwiftUI

struct WCDView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var s: shows
    var body: some View {
        VStack{
            
            Text("Winterfest Can Drive")
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 24, weight: .heavy))
                .foregroundColor(Color.Gray)
            
            Text("Leaderboard")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Mr. Elder - 213")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Blu)
                        .frame(width: 213, height: 25)
                    
                    Text("Mrs. Sweeney - 170")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Blu)
                        .frame(width: 170, height: 25)
                    
                    Text("Mr. Swope - 129")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Blu)
                        .frame(width: 129, height: 25)
                }
                
                Spacer()
            }
            .padding()
            .padding(.horizontal, 10)
            
            Spacer()
         
            ButtonView(title: "Join Competition"){
                s.showWCD = true
                userInfo.joinedCompetitions.append(CompetitionInfo())
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 17)
        }
        .ignoresSafeArea()
    }
}

struct WCDView_Previews: PreviewProvider {
    static var previews: some View {
        WCDView()
    }
}
