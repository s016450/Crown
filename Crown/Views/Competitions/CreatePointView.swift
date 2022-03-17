//
//  CreateScoreCompView.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import SwiftUI

struct CreatePointView: View {
    
<<<<<<< HEAD
    @State var competitionInfo : CompetitionInfo = CompetitionInfo()
    //@EnviornmentObject var competitionInfo: CompetitionInfo
    
=======
    //@EnvironmentObject var competitionInfo: CompetitionInfo
     
>>>>>>> main
    var body: some View { 
        
        NavigationView{
            
            VStack{
                Text("New Score Competition")
                    .font(.system(size: 24, weight: .bold))
                    .padding(50)
                
                //enter competition name
<<<<<<< HEAD
                TextField("Enter competition name", text: $competitionInfo.compName)
=======
                /*TextField("Competition Name", text: $competitionInfo.compName)
>>>>>>> main
                    .frame(maxWidth: .infinity,
                           minHeight: 44)
                    .padding(.leading, 30)
                    .foregroundColor(Color.Gray.opacity(0.5))
<<<<<<< HEAD
=======
                */
                
>>>>>>> main
                
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
                
    
                    NavigationLink(
                        destination: PointCompView(),
                        label: {
                            Text("Create Competetion")
                                .font(.system(size: 18, weight: .bold))
                                .padding()
                                .foregroundColor(.Purple)
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.Purple, lineWidth: 4))
                                .padding()
                                
                        }) //end navlink label
                
            }//end vstack
            
//<<<<<<< HEAD:Crown/Views/Competitions/CreateScoreCompView.swift
//=======
//
//            NavigationLink(
//                destination: PointCompView(),
//                label: {
//                    Text("Create Competetion")
//                })
//
//>>>>>>> main:Crown/Views/Competitions/CreatePointView.swift
        }//end nav view
        
    }//end body
    
}//end struct

struct CreateScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePointView()
    }
}//end struct
