//
//  CreateTimeCompView.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/1/22.
//

import SwiftUI

//this class will set up 
struct CreateTimeCompView: View {
    
    @State private var enddate = Date()
    // @EnvironmentObject var competetitionInfo : CompetitionInfo
    @StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    @State var competitors: [String: Int] = [:]
    @State var manualCompetitors = false
    @State var privateCompetition = false
    @State var competitorName: String = ""
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                Text("New Time Competition")
                    .font(.system(size: 32, weight: .bold))
                    .padding()
                    .foregroundColor(.Gray)
                    .padding(.top, 75)
                
                TextField("Competition Name", text: $competitionInfo.compName)
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 45)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .foregroundColor(Color.Gray.opacity(0.5))
                    .background(
                        
                        ZStack(alignment: .leading){
                            
                            
                            Image(systemName: "pencil")
                                .font(.system(size: 16, weight: .heavy))
                                .padding(.leading, 10)
                                .foregroundColor(Color.Gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.Gray.opacity(0.5))
                                .frame(maxWidth: 410)
                        }
                    )
                    .padding(.top, 20)
                
                
                TextField("Enter Competition Name", text:  $competitionInfo.compName)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .padding(.top, 40)
                    .padding(.leading , 10)
                
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                
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
                        .padding()
                    Button("Add"){
                        if competitorName != ""{
                            competitors[competitorName] = 0
                            competitorName = ""
                        }
                    }
                    ScrollView{
                        LazyVGrid(columns: [
                            GridItem(.fixed(UIScreen.main.bounds.width - 20))
                        ], content: {
                            ForEach(competitors.sorted(by: >), id: \.key) { key, value in
                                HStack{
                                    Text(key)
                                    Spacer()
                                    Image(systemName: "trash")
                                }
                            }
                        })
                        
                        
                    }
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
                Spacer(minLength: 0)
                
                DatePicker("Select End Date", selection: $competitionInfo.endDate)
                    .foregroundColor(Color.Purple)
                    .padding()
                
                
                //Button that takes you to the time competition
                //Navigation View
                Spacer(minLength: 0)
                
            }.ignoresSafeArea(.all)
        }.ignoresSafeArea(.all)
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}
