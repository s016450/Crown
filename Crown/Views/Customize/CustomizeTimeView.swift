//
//  PreviewTimeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/21/22.
//

import SwiftUI

struct CustomizeTimeView: View {
    
    //@StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    
    @EnvironmentObject var competitionInfo : CompetitionInfo
    
    var body: some View {
        
        let names = getThree(defaults: ["Competitor 1", "Competitor 2", "Competitor 3"], competitors: competitionInfo.competitors)
        VStack {
            
            Text(competitionInfo.compName == "" ? "New Time Competition" : competitionInfo.compName)
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 28, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top,80)
            
            HStack{
                Image(systemName: "stopwatch")
                    .font(.system(size: 16, weight: .bold))
                Text(getTime(time: competitionInfo.startDate.distance(to: competitionInfo.endDate)))
                    .font(.system(size: 16, weight: .bold))
            }
            .padding()
            
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
                    Button(action: {
                        competitionInfo.barColor = Color.Red},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Red)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Purple},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Purple)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Blue},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Blue)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Orange},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Orange)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Yellow},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Yellow)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.green},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.green)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Blu},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Blu)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.Pink},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Pink)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        competitionInfo.barColor = Color.LightGray},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.LightGray)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                }
                .padding()
            }
            .padding()
            
            Spacer()
            Button(action: {
                FirebaseFunctions.createUser(competitor: competitionInfo) { userInfo in
                    print("user uploaded")
                }
                
            }, label: {
            
                Text("Create")
                    .frame(maxWidth: .infinity,
                           maxHeight: 50)
                    .background(Color.Yellow)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.Yellow, lineWidth: 2))
            })
            .padding(.horizontal)
            .padding(.bottom, 170)
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50)
    }
}

func getTime(time: Double)-> String{
    var time = time
    var formatted = ""
    
    if Int(time / 86400) > 0{
        formatted += String(Int(time/86400)) + " Days, "
        time.formTruncatingRemainder(dividingBy: 86400)
    }
    if Int(time / 3600) > 0{
        formatted += String(Int(time/3600)) + " Hours, "
        time.formTruncatingRemainder(dividingBy: 3600)
    }
    if Int(time / 60) > 0{
        formatted += String(Int(time/60)) + " Minutes, "
        time.formTruncatingRemainder(dividingBy: 60)
    }
    formatted += String(Int(time)) + " Seconds Left"
    return formatted
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
