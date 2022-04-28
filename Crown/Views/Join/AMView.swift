//
//  AMView.swift
//  Crown
//
//  Created by Jonathan  Miller  on 4/28/22.
//

import SwiftUI

struct AMView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var s: shows
    var body: some View {
        VStack{
            
            Text("April Meterboard")
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
                    Text("Max - 63,000")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Red)
                        .frame(width: 300, height: 25)
                    
                    Text("Charlie - 38,656")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Red)
                        .frame(width: 184, height: 25)
                    
                    Text("Isaac - 36,054")
                        .font(.system(size: 14, weight: .semibold))
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.Red)
                        .frame(width: 171, height: 25)
                }
                
                Spacer()
            }
            .padding()
            .padding(.horizontal, 10)
            
            Spacer()
         
            ButtonView(title: "Join Competition"){
                s.showAM = true
                userInfo.joinedCompetitions.append(CompetitionInfo())
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 17)
        }
        .ignoresSafeArea()
    }
}

struct AMView_Previews: PreviewProvider {
    static var previews: some View {
        AMView()
    }
}
