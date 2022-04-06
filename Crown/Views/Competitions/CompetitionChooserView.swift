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
    @State var pointColor = Color.Gray
    @State var bracketColor = Color.Gray
    @State var competitionChoice : String = ""
    @State var showTimeInfo: Bool = false
    @State var showPointInfo: Bool = false
    @State var showBracketInfo: Bool = false
    @State var timeOffset: CGFloat = 0.0
    @State var pointOffset: CGFloat = 0.0
    @State var bracketOffset: CGFloat = 0.0
    @State var lock: Bool = true
    
    
    var body: some View {
        
        VStack{
            VStack{
                
                Text("Competition Builder")
                    .font(.system(size: 35, weight: .heavy))
                    .foregroundColor(Color.Gray)
                    .padding(.top, 20)

                Spacer()
                Button(action: {
                    withAnimation{
                        showTimeInfo = true
                        if buttonColor == Color.gray{
                            timeColor = Color.Yellow
                            buttonColor = Color.Yellow
                            competitionChoice = "time"
                            timeOffset = 53
                            pointOffset = 53
                            bracketOffset = 53
                            lock = false
                        }
                        else if buttonColor == Color.Yellow && competitionChoice != "time"{
                            showTimeInfo = true
                            showPointInfo = false
                            showBracketInfo = false
                            timeColor = Color.Yellow
                            pointColor = Color.Gray
                            bracketColor = Color.Gray
                            competitionChoice = "time"
                            timeOffset = 53
                            pointOffset = 53
                            bracketOffset = 53
                            lock = false
                        }
                        else{
                            competitionChoice = ""
                            showTimeInfo = false
                            timeColor = Color.Gray
                            buttonColor = Color.gray
                            timeOffset = 0
                            pointOffset = 0
                            bracketOffset = 0
                            lock = true
                        }
                    }}, label: {
                        HStack(spacing: -12){
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(systemName: "stopwatch")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(timeColor)
                                .padding()
                                .background(Color.clear)
                            
                            Text("Time")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(timeColor)
                                .background(Color.clear)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    })
                    .offset(y: timeOffset)
                
                if showTimeInfo{
                    TimeInfo()
                        .offset(y: 50)
                        .transition(.scale)
                    
                }
                
                Button(action: {
                    withAnimation{
                        if buttonColor == Color.gray{
                            showPointInfo = true
                            pointColor = Color.Yellow
                            buttonColor = Color.Yellow
                            competitionChoice = "point"
                            timeOffset = 53
                            pointOffset = 53
                            bracketOffset = 53
                            lock = false
                        }
                        else if buttonColor == Color.Yellow && competitionChoice != "point"{
                            showPointInfo = true
                            showTimeInfo = false
                            showBracketInfo = false
                            pointColor = Color.Yellow
                            timeColor = Color.Gray
                            bracketColor = Color.Gray
                            competitionChoice = "point"
                            timeOffset = 53
                            pointOffset = 53
                            bracketOffset = 53
                            lock = false
                        }
                        else{
                            competitionChoice = ""
                            showPointInfo = false
                            pointColor = Color.Gray
                            buttonColor = Color.gray
                            timeOffset = 0
                            pointOffset = 0
                            bracketOffset = 0
                            lock = true
                        }
                    }}, label: {
                        HStack(spacing: -12){
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(systemName: "star.circle")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(pointColor)
                                .padding()
                                .background(Color.clear)
                            
                            Text("Score")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(pointColor)
                                .background(Color.clear)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    })
                    .offset(y: pointOffset)
                
                if showPointInfo{
                    PointInfo()
                        .offset(y: 50)
                        .transition(.scale)
                }
                
                Button(action: {
                    withAnimation{
                        if buttonColor == Color.gray{
                            showBracketInfo = true
                            bracketColor = Color.Yellow
                            buttonColor = Color.Yellow
                            competitionChoice = "bracket"
                            timeOffset = 56
                            pointOffset = 56
                            bracketOffset = 56
                            lock = false
                        }
                        else if buttonColor == Color.Yellow && competitionChoice != "bracket"{
                            showBracketInfo = true
                            showTimeInfo = false
                            showPointInfo = false
                            bracketColor = Color.Yellow
                            timeColor = Color.Gray
                            pointColor = Color.Gray
                            competitionChoice = "bracket"
                            timeOffset = 56
                            pointOffset = 56
                            bracketOffset = 56
                            lock = false
                        }
                        else{
                            competitionChoice = ""
                            showBracketInfo = false
                            bracketColor = Color.Gray
                            buttonColor = Color.gray
                            timeOffset = 0
                            pointOffset = 0
                            bracketOffset = 0
                            lock = true
                        }
                    }}, label: {
                        HStack(spacing: -12){
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(systemName: "sportscourt")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(bracketColor)
                                .padding()
                                .background(Color.clear)
                            
                            Text("Bracket")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(bracketColor)
                                .background(Color.clear)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    })
                    .offset(y: bracketOffset)
                
                
                if showBracketInfo{
                    BracketInfo()
                        .offset(y: 50)
                        .transition(.asymmetric(insertion: .scale, removal: .scale))
                }
                
                Spacer()
                
            }
            NavigationLink(destination: getDestination(choice: competitionChoice)){
                Text("Create Competition")
                    .frame(maxWidth: .infinity,
                           maxHeight: 50)
                    .background(buttonColor)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(buttonColor, lineWidth: 2))
            }
            .disabled(lock)
            .padding(.bottom, 17)
        }
        .ignoresSafeArea()
        .padding(.horizontal, 15)
    }
}
func getDestination(choice: String)-> AnyView{
    if choice == "time"{
        return AnyView(CreateTimeCompView())
    }
    else if choice == "point"{
        return AnyView(CreatePointView())
    }
    else if choice == "bracket"{
        
    }
    return AnyView(HomeView())
}

struct CompetitionChooserView_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionChooserView()
    }
}
