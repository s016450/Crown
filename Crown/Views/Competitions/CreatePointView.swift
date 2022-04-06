//
//  CreateScoreCompView.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import SwiftUI

struct CreatePointView: View {
    
    //@StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    @EnvironmentObject var competitionInfo : CompetitionInfo
    @State var manualCompetitors = false
    @State var privateCompetition = false
    @State var competitorName: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("New Time Competition")
                    .font(.system(size: 32, weight: .heavy))
                    .padding()
                    .foregroundColor(.Gray)
                    .padding(.top, 20)
                
                
                HStack(spacing: 30){
                    VStack(spacing: 40){
                        Image(systemName: "pencil")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(.Gray)
                        /*
                         Image(systemName: "star.circle")
                         .font(.system(size: 20, weight: .heavy))
                         .foregroundColor(.Gray)
                         Image(systemName: privateCompetition == true ? "lock.fill" : "lock.open.fill")
                         .font(.system(size: 19))
                         .foregroundColor(.Gray)*/
                    }
                    VStack(spacing: 38){
                        TextField("Competition Name", text: $competitionInfo.compName)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.Yellow)
                        /*
                         TextField("Ending Point Value", text: $competitionInfo.points)
                         .font(.system(size: 18, weight: .bold))
                         .foregroundColor(Color.Yellow)
                         Toggle(isOn: $privateCompetition, label: {
                         Text("Make Competition Private")
                         .font(.system(size: 18, weight: .bold))
                         .foregroundColor(.Gray)
                         })
                         .toggleStyle(SwitchToggleStyle(tint: .Yellow))
                         */
                    }
                }
                .padding()
                
                HStack(spacing: 21){
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.Gray)
                    Toggle(isOn: $manualCompetitors){
                        
                        Text("Manually Enter Competitors")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.Gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .Yellow))
                }
                .padding()
                
                if manualCompetitors{
                    
                    HStack(spacing: 35){
                        Image(systemName: "person.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.Gray)
                        TextField("Competitor Name", text: $competitorName)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.Yellow)
                    }
                    .padding()
                    
                    
                    ButtonView(title: "Add",
                               background: .Yellow,
                               foreground: .white,
                               border: .Yellow){
                        if competitorName != ""{
                            competitionInfo.competitors.append(Competitors(user: competitorName, points: 0))
                            competitorName = ""
                        }
                    }
                               .frame(width: 50, height: 25)
                    
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns: [
                            GridItem(.fixed(UIScreen.main.bounds.width - 80))
                        ], content: {
                            ForEach(competitionInfo.competitors) { info in
                                HStack{
                                    Text(info.user)
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                    Button(action: {
                                        competitionInfo.competitors.remove(at: getIndex(name: info.user, competitors: competitionInfo.competitors))
                                    }, label: {
                                        Image(systemName: "trash")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundColor(.Gray)
                                        
                                    })
                                }
                                .padding(.vertical, 5)
                            }
                        })
                    }
                    .frame(width: 100, height: 110, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.Gray, lineWidth: 1.5)
                        
                            .frame(width: 350, height: 120)
                            .background(Color.Yellow.opacity(0.1))
                    )
                    .padding(.top, 30)
                    
                }
                
                
                Toggle(isOn: $privateCompetition, label: {
                    Image(systemName: privateCompetition == true ? "lock.fill" : "lock.open.fill")
                        .foregroundColor(.Gray)
                    Text("Make Competition Private")
                        .padding(.leading, privateCompetition == true ? 27.3: 25)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.Gray)
                    
                })
                    .toggleStyle(SwitchToggleStyle(tint: .Yellow))
                    .padding()
                
                HStack(spacing: 30){
                    Image(systemName: "star.circle")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.Gray)
                    TextField("Ending Point Value", text: $competitionInfo.points)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color.Yellow)
                }
                .padding()
                
                
                Spacer()
                
                
                NavigationLink(destination: CustomizeTimeView()){
                    Text("Create Competition")
                        .frame(maxWidth: .infinity,
                               maxHeight: 50)
                        .background(Color.Yellow)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.Yellow, lineWidth: 2))
                }
                .padding(.horizontal, 15)
                .padding(.bottom, manualCompetitors == true ? -2.5:  17)
                
                
            }.ignoresSafeArea(.all)
                .accentColor(.Yellow)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
        
    }
    
}

struct CreateScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePointView()
    }
}
