//
//  PreviewTimeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/21/22.
//

import SwiftUI

struct CustomizeTimeView: View {
    
    @EnvironmentObject var competitionInfo : CompetitionInfo
    
    var body: some View {
        
        let names = getThree(defaults: ["Competitor 1", "Competitor 2", "Competitor 3"], competitors: competitionInfo.competitors)
        
        VStack {
            
            Text(competitionInfo.compName == "" ? "New Time Competition" : competitionInfo.compName)
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 28, weight: .heavy))
                .foregroundColor(competitionInfo.titleColor)
                .padding(.top,80)
            
            
            
            VStack{
                
                Text("Leaderboard")
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom,30)
                
                VStack(alignment: .leading){
                    
                    Text(names[0])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(competitionInfo.barColor)
                        .frame(width: 300, height: 50)
                    Text(names[1])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(competitionInfo.barColor)
                        .frame(width: 250, height: 50)
                    Text(names[2])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(competitionInfo.barColor)
                        .frame(width: 200, height: 50)
                }
                .padding(.top, 10)
              
                HStack{
                    Text("Title")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    ColorPicker("", selection: $competitionInfo.titleColor, supportsOpacity: false)
                }
                .padding()
                HStack{
                    Text("Bar")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    ColorPicker("", selection: $competitionInfo.barColor, supportsOpacity: false)
                }
                .padding()
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50)
        
        
    }
}

func getThree(defaults: [String], competitors: [Competitors])-> [String]{
    
    var display = defaults
    
    var count = 0
    
    for competitor in competitors{
        if count < 3{
            display[count] = competitor.user
            count += 1
        }
    }
    return display
}


struct PreviewTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeTimeView()
    }
}
