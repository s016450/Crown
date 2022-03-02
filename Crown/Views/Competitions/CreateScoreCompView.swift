//
//  CreateScoreCompView.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import SwiftUI

struct CreateScoreCompView: View {
    
    @EnvironmentObject var competitionInfo: CompetitionInfo
    
    var body: some View { 
          
        VStack{
            Text("New Score Competition")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.Gray)
            
            //enter competition name
            TextField("Competition Name", text: $competitionInfo.compName)
                .frame(maxWidth: .infinity,
                       minHeight: 44)
                .padding(.leading, 30)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .foregroundColor(Color.Gray.opacity(0.5))
                .background(
                    
                    ZStack(alignment: .leading){
                        
                        
                        Image(systemName: "envelope")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.Gray.opacity(0.5))
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.Gray.opacity(0.5))
                    }
                )
            
            
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
        
        
    }
}

struct CreateScoreCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateScoreCompView()
    }
}
