//
//  MDView.swift
//  Crown
//
//  Created by Jonathan  Miller  on 4/28/22.
//

import SwiftUI

struct MDView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var s: shows
    var body: some View {
        VStack{
            
            Text("Martia Dementia MMXXII")
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 24, weight: .heavy))
                .foregroundColor(Color.Gray)
            
            Image("Bracket")
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .padding(.horizontal, 10)
            
            Spacer()
         
            ButtonView(title: "Join Competition"){
                s.showMD = true
                userInfo.joinedCompetitions.append(CompetitionInfo())
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 17)
        }
        .ignoresSafeArea()
    }
}

struct MDView_Previews: PreviewProvider {
    static var previews: some View {
        MDView()
    }
}
