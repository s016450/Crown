//
//  ScoreCompView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/23/22.
//

import SwiftUI

struct PointCompView: View {
    
    @State var competitionInfo : CompetitionInfo = CompetitionInfo()
    //@EnviornmentObject var competitionInfo: CompetitionInfo
    
    var body: some View {
        //\(competitionInfo.compName)
        VStack{
            Text("hello")
                .font(.system(size: 24, weight: .bold))
                .padding(50)
            
            Text("\(competitionInfo.compPoints)")
            
            Text("Competitors:")
            //leaderboard of competitors
            
            Text("Update Points")
                .font(.system(size: 15, weight: .bold))
                .padding()
                .foregroundColor(.Yellow)
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.Yellow, lineWidth: 4))
                .padding()
            
            
        }//end vstack
        
        
    }//end body
}//end view
//array of users, on one view

struct ScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        PointCompView()
    }
}
