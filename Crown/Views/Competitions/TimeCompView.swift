//
//  TimeCompView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/23/22.
//

import SwiftUI

struct TimeCompView: View {
    // @EnvironmentObject var competetitionInfo : CompetitionInfo
     @StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    
    var body: some View {
        Text("End Date: \(competitionInfo.endDate)")
      
    }
}

//based on a set amount of days or a specific date
// displays the leaderboard where people can input names as well as input scores

struct TimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        TimeCompView()
    }
}
