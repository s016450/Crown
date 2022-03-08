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
    @State var competitionChoice : String? = nil
    @State var showTimeInfo: Bool = false
    @State var showPointInfo: Bool = false
    @State var showBracketInfo: Bool = false
    @State var timeOffset: CGFloat = 0.0
    @State var pointOffset: CGFloat = 0.0
    @State var bracketOffset: CGFloat = 0.0
    @State var isShowingBox: Bool = false
    @State var takeToTime: Bool = false

    var body: some View {
        
        NavigationView{
            
            VStack{
                VStack{
                    Spacer()
                    Button(action: {
                            withAnimation{
                                showTimeInfo = true
                                if buttonColor == Color.gray{
                                    timeColor = Color.Yellow
                                    buttonColor = Color.Yellow
                                    competitionChoice = "time"
                                    timeOffset = 55
                                    pointOffset = 55
                                    bracketOffset = 55
                                }
                                else if buttonColor == Color.Yellow && competitionChoice != "time"{
                                    showTimeInfo = true
                                    showPointInfo = false
                                    showBracketInfo = false
                                    timeColor = Color.Yellow
                                    pointColor = Color.Gray
                                    bracketColor = Color.Gray
                                    competitionChoice = "time"
                                    timeOffset = 55
                                    pointOffset = 55
                                    bracketOffset = 55
                                }
                                else{
                                    competitionChoice = nil
                                    showTimeInfo = false
                                    timeColor = Color.Gray
                                    buttonColor = Color.gray
                                    timeOffset = 0
                                    pointOffset = 0
                                    bracketOffset = 0
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
                                    timeOffset = 55
                                    pointOffset = 55
                                    bracketOffset = 55
                                }
                                else if buttonColor == Color.Yellow && competitionChoice != "point"{
                                    showPointInfo = true
                                    showTimeInfo = false
                                    showBracketInfo = false
                                    pointColor = Color.Yellow
                                    timeColor = Color.Gray
                                    bracketColor = Color.Gray
                                    competitionChoice = "point"
                                    timeOffset = 55
                                    pointOffset = 55
                                    bracketOffset = 55
                                }
                                else{
                                    competitionChoice = nil
                                    showPointInfo = false
                                    pointColor = Color.Gray
                                    buttonColor = Color.gray
                                    timeOffset = 0
                                    pointOffset = 0
                                    bracketOffset = 0
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
                                    timeOffset = 52.5
                                    pointOffset = 52.5
                                    bracketOffset = 52.5
                                }
                                else if buttonColor == Color.Yellow && competitionChoice != "bracket"{
                                    showBracketInfo = true
                                    showTimeInfo = false
                                    showPointInfo = false
                                    bracketColor = Color.Yellow
                                    timeColor = Color.Gray
                                    pointColor = Color.Gray
                                    competitionChoice = "bracket"
                                    timeOffset = 52.5
                                    pointOffset = 52.5
                                    bracketOffset = 52.5
                                }
                                else{
                                    competitionChoice = nil
                                    showBracketInfo = false
                                    bracketColor = Color.Gray
                                    buttonColor = Color.gray
                                    timeOffset = 0
                                    pointOffset = 0
                                    bracketOffset = 0
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

                ButtonView(title: "Create Competition",
                           background: buttonColor,
                           foreground: Color.white,
                           border: buttonColor){
                    
                    switch competitionChoice{
                    
                    case "time":
                        
                        break
                    case "point":

                        break
                    case "bracket":
                        break
                   
                    case .none:
                        
                        break
                    case .some(_):
                        
                        break
                    }
                    
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
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
