//
//  PreviewTimeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/21/22.
//

import SwiftUI

struct CustomizeTimeView: View {
    
    @EnvironmentObject var competitionInfo : CompetitionInfo
    var name1 = "Competitor 1"
    var name2 = "Competitor 2"
    var name3 = "Competitor 3"

    var body: some View {
        
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
                VStack(alignment: .leading){
                    
                        Text(name1)
                            .font(.system(size: 16, weight: .bold))
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(competitionInfo.barColor)
                            .frame(width: 300, height: 50)
                        Text(name2)
                            .font(.system(size: 16, weight: .bold))
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(competitionInfo.barColor)
                            .frame(width: 250, height: 50)
                        Text(name3)
                            .font(.system(size: 16, weight: .bold))
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(competitionInfo.barColor)
                            .frame(width: 200, height: 50)
                }
                Button("Color"){
                                        competitionInfo.barColor = Color.green
                                    }
                                    ColorPicker("Background", selection: $competitionInfo.backgroundColor, supportsOpacity: false)
                                    ColorPicker("Title", selection: $competitionInfo.titleColor, supportsOpacity: false)
                                    ColorPicker("Bar", selection: $competitionInfo.barColor, supportsOpacity: false)
            }
            .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50)
        .background(competitionInfo.backgroundColor)
    }
}

func getFive(competitors: [String: Int])->[String]{
    
    var names = competitors.keys.sorted(by: <)
    var count = names.count
    
    while names.count < 5{
        count += 1
        names.append("Competitor \(count)")
    }
    
    while names.count > 5{
        count -= 1
        names.remove(at: count)
    }
    
    return names
}


struct PreviewTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeTimeView()
    }
}
