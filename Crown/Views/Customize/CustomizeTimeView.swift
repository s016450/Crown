//
//  PreviewTimeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/21/22.
//

import SwiftUI

struct CustomizeTimeView: View {
    
    @State private var backgroundColor = Color.white
    @State private var titleColor = Color.Gray
    @State private var barColor = Color.Yellow
    @StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    
    
    var body: some View {
        
        
        VStack {
            
            Text(competitionInfo.compName == "" ? "New Time Competition" : competitionInfo.compName)
                .font(.system(size: 28, weight: .heavy))
                .foregroundColor(titleColor)
                .padding(.top,80)
            
            ColorPicker("",selection: $titleColor, supportsOpacity: false)
                .frame(width: 25, height: 25)
            
            VStack{
                Text("Leaderboard")
                    .font(.system(size: 26, weight: .bold))
                VStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(barColor)
                        .frame(width: 350, height: 50)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(barColor)
                        .frame(width: 350, height: 50)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(barColor)
                        .frame(width: 350, height: 50)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(barColor)
                        .frame(width: 350, height: 50)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(barColor)
                        .frame(width: 350, height: 50)
                }
                .padding()
                
            }
            
            ColorPicker("",selection: $backgroundColor, supportsOpacity: false)
                .frame(width: 25, height: 25)
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50)
        .background(backgroundColor)
    }
}

struct PreviewTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeTimeView()
    }
}
