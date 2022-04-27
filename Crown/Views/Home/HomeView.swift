//
//  HomeView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        VStack{
            Text("Active Competitions")
                .font(.system(size: 35, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top, 30)
            
            ScrollView(showsIndicators: false){
                VStack{
                    Text("My Competitions")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.Yellow)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                    
                    if userInfo.ownCompetitions.count == 0{
                        Text("competitions you create will appear here")
                            .foregroundColor(Color.Gray)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top, 5)
                    }
                    
                    ForEach(userInfo.ownCompetitions) { info in
                        
                        NavigationLink(destination: {
                            
                            
                        },
                                       label: {
                            VStack{
                                
                                Text(info.compName)
                                    .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 28, weight: .heavy))
                                    .foregroundColor(Color.Gray)
                                
                                Text("Leaderboard")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(Color.Gray)
                                    .padding(.top)
                                
                                HStack{
                                    VStack(alignment: .leading){
                                        if info.competitors.count >= 1{
                                            
                                            if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[0]]{
                                                Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[0]) - \(String(x))")
                                                    .font(.system(size: 14, weight: .semibold))
                                                if let y = info.points{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 :  CGFloat(y/x), height: 25)
                                                }
                                                
                                                else{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 : CGFloat(300/x), height: 25)
                                                    
                                                }
                                            }
                                        }
                                        if info.competitors.count >= 2{
                                            
                                            if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[1]]{
                                                Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[1]) - \(String(x))")
                                                    .font(.system(size: 14, weight: .semibold))
                                                if let y = info.points{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 :  CGFloat(y/x), height: 25)
                                                }
                                                
                                                else{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 : CGFloat(300/x), height: 25)
                                                    
                                                }
                                            }
                                        }
                                        if info.competitors.count >= 3{
                                            
                                            if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[2]]{
                                                Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[2]) - \(String(x))")
                                                    .font(.system(size: 14, weight: .semibold))
                                                if let y = info.points{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 :  CGFloat(y/x), height: 25)
                                                }
                                                
                                                else{
                                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                        .fill(Color(info.barColor))
                                                        .frame(width: x == 0 ? 5 : CGFloat(300/x), height: 25)
                                                    
                                                }
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                                .padding(.horizontal, 10)
                            }
                            
                        })
                    }
                    Text("Joined Competitions")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.Yellow)
                        .padding(.top, 20)
                    if userInfo.joinedCompetitions.count == 0{
                        Text("competitions you join will appear here")
                            .foregroundColor(Color.Gray)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top, 5)
                        
                        
                    }
                }
            }
            Spacer()
        }
        .accentColor(Color.Gray)
        .ignoresSafeArea()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
        }
    }
}

func dictionarify(competitors: [Competitors])->[String: Int]{
    var dct = [String: Int]()
    for competitor in competitors{
        dct[competitor.user] = competitor.points
    }
    return dct
}
