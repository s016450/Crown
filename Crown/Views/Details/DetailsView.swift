//
//  DetailsView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 4/27/22.
//

import SwiftUI

struct DetailsView: View {
    let info: CompetitionInfo
    var body: some View {
        
        VStack{
            
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
            
        }

        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(info: CompetitionInfo())
    }
}
