//
//  CompetitionChooserView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/24/22.
//

import SwiftUI

struct CompetitionChooserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var buttonColor = Color.gray
    @State var timeColor = Color.Gray
    @State var pointsColor = Color.Gray
    @State var bracketColor = Color.Gray
    @State var competitionChoice : String? = nil
    @State var showTimeInfo: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                Spacer()
                
                Button(action: {
                    showTimeInfo = true
                    if buttonColor == Color.gray{
                        timeColor = Color.Yellow
                        buttonColor = Color.Yellow
                        competitionChoice = "time"
                    }
                    else if buttonColor == Color.Yellow && competitionChoice != "time"{
                        showTimeInfo = true
                        timeColor = Color.Yellow
                        pointsColor = Color.Gray
                        bracketColor = Color.Gray
                        competitionChoice = "time"
                    }
                    else{
                        showTimeInfo = false
                        timeColor = Color.Gray
                        buttonColor = Color.gray
                    }
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(timeColor)
                            .padding()
                            .background(Color.white)
                        
                        Text("Time")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(timeColor)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                
                if showTimeInfo{
                    TimeInfo()
                }
                
                Button(action: {
                    if buttonColor == Color.gray{
                        pointsColor = Color.Yellow
                        buttonColor = Color.Yellow
                        competitionChoice = "points"
                    }
                    else if buttonColor == Color.Yellow && competitionChoice != "points"{
                        pointsColor = Color.Yellow
                        timeColor = Color.Gray
                        bracketColor = Color.Gray
                        competitionChoice = "points"
                    }
                    else{
                        pointsColor = Color.Gray
                        buttonColor = Color.gray
                    }
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(pointsColor)
                            .padding()
                            .background(Color.white)
                        
                        Text("Score")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(pointsColor)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                Button(action: {
                    if buttonColor == Color.gray{
                        bracketColor = Color.Yellow
                        buttonColor = Color.Yellow
                        competitionChoice = "bracket"
                    }
                    else if buttonColor == Color.Yellow && competitionChoice != "bracket"{
                        bracketColor = Color.Yellow
                        timeColor = Color.Gray
                        pointsColor = Color.Gray
                        competitionChoice = "bracket"
                    }
                    else{
                        bracketColor = Color.Gray
                        buttonColor = Color.gray
                    }
                }, label: {
                    HStack(spacing: -12){
                        Spacer()
                        Spacer()
                        Spacer()
                        Image(systemName: "stopwatch")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(bracketColor)
                            .padding()
                            .background(Color.white)
                        
                        Text("Bracket")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(bracketColor)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                })
                
                Spacer()
                Spacer()
                ButtonView(title: "Create Competition",
                           background: buttonColor,
                           foreground: Color.white,
                           border: buttonColor){
            
                }
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationTitle("Create Competition")
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle.fill")
                    .font(.title2)
                    .accentColor(Color.Gray)
            })
        }
    }
}


struct CompetitionChooserView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionChooserView()
    }
}
