//
//  CustomizePointView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 4/22/22.
//

import SwiftUI

struct CustomizePointView: View {
    
    @EnvironmentObject var userInfo : UserInfo
    @EnvironmentObject var change: Change
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var color = Color.Yellow
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.Yellow)
            }
        }
    }
    
    var body: some View {
        
        let names = getThree(defaults: ["Competitor 1", "Competitor 2", "Competitor 3"], competitors: self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].competitors)
        VStack {
            
            Text(self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].compName == "" ? "New Point Competition" : self.userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].compName)
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                .multilineTextAlignment(.center)
                .font(.system(size: 28, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top,80)
            
            VStack{
                
                Text("Leaderboard")
                    .font(.system(size: 26, weight: .bold))
                    .padding(.bottom,30)
                
                VStack(alignment: .leading){
                    
                    Text(names[0])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(color)
                        .frame(width: 300, height: 50)
                    Text(names[1])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(color)
                        .frame(width: 250, height: 50)
                    Text(names[2])
                        .font(.system(size: 16, weight: .bold))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(color)
                        .frame(width: 200, height: 50)
                }
                .padding(.top, 10)
                
                
                HStack{
                    Button(action: {
                        color = .Red
                        print(userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1].barColor)}
                           ,
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Red)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Purple},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Purple)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Blue},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Blue)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Orange},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Orange)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Yellow},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Yellow)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .green},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.green)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Blu},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Blu)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .Pink},
                           label: {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.Pink)
                            .frame(width: 25, height: 25)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(Color.Gray))})
                    Button(action: {
                        color = .LightGray},
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
                FirebaseFunctions.createUser(competitor: userInfo.ownCompetitions[userInfo.ownCompetitions.count - 1]) { userInfo in
                    print("user uploaded")
                }
                change.selectedIndex = 0
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height+50)
    }
}

struct CustomizePointView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizePointView()
    }
}
