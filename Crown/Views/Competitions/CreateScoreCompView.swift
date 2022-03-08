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
                    .font(.system(size: 18, weight: .bold))
                   
                
                //enter competition name
                TextField("Enter Competition Name", text: $competitionInfo.compName)
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .foregroundColor(Color.Gray.opacity(0.5))
                
                
            
                //user info
                //array to add users
                Text("Enter Competitors Below")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                    .padding()
                
                //input number of points needed
                
                Text("Enter Points End Goal")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                
                TextField("Enter points here", text: $competitionInfo.compPoints)
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .foregroundColor(Color.Gray.opacity(0.5))
                
                ButtonView(title: "Create Account",
                           background: .clear,
                           foreground: Color.Yellow,
                           border: Color.Yellow){
                    NavigationLink(
                        destination: ScoreCompView(),
                        label: {
                            Text("Create Competetion")
                                .foregroundColor(.Purple)
                        }) //end navlink label
                
                
            }//end vstack
            
        }//end nav view
        
    }//end nav view
}//end body
    
}//end struct

struct CreateScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateScoreCompView()
    }
}//end struct
