//
//  CreateTimeCompView.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/1/22.
//

import SwiftUI

//this class will set up 
struct CreateTimeCompView: View {
    
    //@StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    @EnvironmentObject var userInfo : UserInfo
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var manualCompetitors = false
    @State var privateCompetition = false
    @State var competitorName: String = ""
    @State var delete = false
    
    var btnBack : some View {
        Button(action: {
            delete = true
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("ic_back") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                Text("Go back")
            }
        }
    }
    
    var body: some View {
        
        VStack{
            VStack(spacing: -3){
                Text("New Time Competition")
                    .font(.system(size: 32, weight: .heavy))
                    .padding()
                    .padding(.top, 15)
                    .foregroundColor(.Gray)
                
                TextField("Competition Name", text: $userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].compName)
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
                        .font(.system(size: 12))
                        .foregroundColor(.Gray)
                    Spacer(minLength: 20)
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
                            self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].competitors.append(Competitors(user: competitorName, points: 0))
                            competitorName = ""
                        }
                    }
                               .frame(width: 50, height: 25)
                    
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns: [
                            GridItem(.fixed(UIScreen.main.bounds.width - 80))
                        ], content: {
                            ForEach(self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].competitors) { info in
                                HStack{
                                    Text(info.user)
                                        .font(.system(size: 18, weight: .semibold))
                                    Spacer()
                                    Button(action: {
                                        self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].competitors.remove(at: getIndex(name: info.user, competitors: userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].competitors))
                                        competitorName = " "
                                        competitorName = ""
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
                
                DatePicker("Start Date", selection: $userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].startDate)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                    .accentColor(.Yellow)
                    .padding()
                
                
                DatePicker("End Date", selection: $userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].endDate)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                    .accentColor(.Yellow)
                    .padding()
                
                
                
                Spacer()
            }
            
            NavigationLink(destination: CustomizeTimeView()){
                Text("Customize")
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
            .padding(.bottom, manualCompetitors == true ? -8:  17)
            
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .accentColor(.Yellow)
        .onDisappear(perform: {
            if delete{
                userInfo.ownCompetitions.remove(at: userInfo.ownCompetitions.count - 1)
            }
        })
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}

func getIndex(name: String, competitors: [Competitors])->Int{
    
    var count = 0
    for competitor in competitors{
        if competitor.user == name{
            return count
        }
        count += 1
    }
    return 0
}
