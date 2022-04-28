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
        
        ScrollView(showsIndicators: false){

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
                
                ForEach(info.competitors){ competitor in
                    
                    Text(competitor.user)
                    
                }
                
            }
            Spacer()
        }

        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(info: CompetitionInfo())
    }
}
