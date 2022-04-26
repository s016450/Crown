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
            
            ScrollView{
                VStack{
                    Text("My Competitions")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.Gray)
                        .padding(.top, 20)
                    
                    if userInfo.ownCompetitions.count == 0{
                        Text("Competitions You Create Will Appear Here")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top, 5)
                    }
                    
                    ForEach(userInfo.ownCompetitions) { info in
                        
                        VStack{
                            
                            Text(info.compName)
                                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 28, weight: .heavy))
                                .foregroundColor(Color.Gray)
                            
                            if info.competitors.count >= 1{
                                
                                if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[0]]{
                                    Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[0]) - \(String(x))")
                                    if let y = info.points{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        //.fill(info.barColor)
                                            .frame(width: x == 0 ? 0 :  CGFloat(y/x), height: 50)
                                    }
                                    
                                    else{
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(Color.Yellow)
                                            .frame(width: x == 0 ? 0 : CGFloat(300/x), height: 50)

                                    }
                                }
                            }
                            if info.competitors.count >= 2{
                                if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[1]]{
                                    Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[1]) - \(String(x))")
                                }
                            }
                            if info.competitors.count >= 3{
                                if let x = dictionarify(competitors: info.competitors)[dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[2]]{
                                    Text("\(dictionarify(competitors: info.competitors).keys.sorted(by: { dictionarify(competitors: info.competitors)[$0]! < dictionarify(competitors: info.competitors)[$1]! })[2]) - \(String(x))")
                                }
                            }
                        }
                        
                    }
                    Text("Joined Competitions")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.Gray)
                        .padding(.top, 20)
                    if userInfo.joinedCompetitions.count == 0{
                        Text("Competitions You Join Will Appear Here")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.top, 5)


                    }
                }
            }
            Spacer()
        }
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
