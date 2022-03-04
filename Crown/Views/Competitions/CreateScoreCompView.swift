//
//  CreateScoreCompView.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import SwiftUI

struct CreateScoreCompView: View {
    
    @State var competitionInfo : CompetitionInfo = CompetitionInfo()
    //@EnviornmentObject var competitionInfo: CompetitionInfo
    
    var body: some View { 
        
        NavigationView{
            
            VStack{
                Text("New Score Competition")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Gray)
                
                //enter competition name
                TextField("Enter Competition Name", text: $competitionInfo.compName)
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .foregroundColor(Color.Gray.opacity(0.5))
                
                
            
                //user info
                //array to add users
                Text("Enter Competitors Below")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Gray)
                
                
                
                //input number of points needed
                
                Text("Enter Points End Goal")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Gray)
                
            }//end vstack
            
            
            NavigationLink(
                destination: ScoreCompView(),
                label: {
                    Text("Create Competetion")
                })
            
        }//end nav view
        
    }
}

struct CreateScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateScoreCompView()
    }
}
