//
//  CreateScoreCompView.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import SwiftUI

struct CreatePointView: View {
    
    // @EnvironmentObject var competetitionInfo : CompetitionInfo
    @State var competitionInfo : CompetitionInfo = CompetitionInfo()
    @State var competitors: [String : Int] = [:]
    @State var manualCompetitors = false
    @State var privateCompetition = false
    @State var competitorName: String = ""
    
    var body: some View { 
        
        NavigationView{
            
            VStack{
                
                VStack(spacing: -3){
                    
                    Text("New Point Competition")
                        .font(.system(size: 32, weight: .bold))
                        .padding()
                        .foregroundColor(.Gray)
                        .padding(.top, 20)
                    
                    TextField("Competition Name", text: $competitionInfo.compName)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity,
                               minHeight: 44)
                        .padding(.leading, 60)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .foregroundColor(Color.Yellow)
                        .background(
                            
                            ZStack(alignment: .leading){
                                
                                
                                Image(systemName: "pencil")
                                    .font(.system(size: 20, weight: .heavy))
                                    .padding(.leading, 10)
                                    .foregroundColor(Color.Gray)
                                
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .stroke(Color.Gray.opacity(0))
                                    .frame(maxWidth: 410)
                            }
                        )
                        .padding(.top, 20)
                    
                    Toggle(isOn: $manualCompetitors){
                        Image(systemName: "person.3.fill")
                            .foregroundColor(.Gray)
                        Text("Manually Enter Competitors")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.Gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .Yellow))
                    .padding()
                    
                    if manualCompetitors{
                        
                        TextField("Competitor Name", text: $competitorName)
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity,
                                   minHeight: 44)
                            .padding(.leading, 60)
                            .foregroundColor(Color.Yellow)
                            .background(
                                
                                ZStack(alignment: .leading){
                                    
                                    
                                    Image(systemName: "person.fill")
                                        .padding(.leading, 10)
                                        .foregroundColor(Color.Gray)
                                    
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .stroke(Color.Gray.opacity(0))
                                        .frame(maxWidth: 410)
                                }
                            )
                        
                        ButtonView(title: "Add",
                                   background: .Yellow,
                                   foreground: .white,
                                   border: .Yellow){
                            if competitorName != ""{
                                competitors[competitorName] = 0
                                competitorName = ""
                            }
                        }
                        .frame(width: 50, height: 25)
                        
                        ScrollView(showsIndicators: false){
                            LazyVGrid(columns: [
                                GridItem(.fixed(UIScreen.main.bounds.width - 80))
                            ], content: {
                                ForEach(competitors.sorted(by: <), id: \.key) { key, value in
                                    HStack{
                                        Text(key)
                                            .font(.system(size: 18, weight: .semibold))
                                        Spacer()
                                        Button(action: {
                                            competitors.removeValue(forKey: key)
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
                                .padding(.leading, privateCompetition == true ? 17.3: 15)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.Gray)
                            
                        })
                        .toggleStyle(SwitchToggleStyle(tint: .Yellow))
                        .padding()
                        
                        DatePicker("Start Date", selection: $competitionInfo.startDate)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.Gray)
                            .accentColor(.Yellow)
                            .padding()
                        
                        
                        DatePicker("End Date", selection: $competitionInfo.endDate)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.Gray)
                            .accentColor(.Yellow)
                            .padding()
                        
                        Spacer()
                        
                    }//end vstack with spacing -3
                    
                    NavigationLink(destination: PointCompView()){
                        Button("Create Competition"){
                            
                        //FirebaseFunctions.createUser(competitor)
                       
                        }
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
                    .padding(.bottom, manualCompetitors == true ? -9.5:  17)
                    
                }//end vstack
                .ignoresSafeArea(.all)
                    .accentColor(.Yellow)
                
            }//end nav view
            
        }//end body
        
    }//end struct
    
    struct CreateScoreCompView_Previews: PreviewProvider {
        static var previews: some View {
            CreatePointView()
        }
    }//end struct
