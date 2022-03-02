//
//  CreateTimeCompView.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/1/22.
//

import SwiftUI

//this class will set up 
struct CreateTimeCompView: View {
    
    @State private var enddate = Date()
    
    var body: some View {
        VStack{
            Text("New Time Competition")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.Gray)
            
            Text("Competition Name")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.Gray)
            
            //Users Info
            Text("Enter The Competitors")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.Gray)
            //use an array to add users
            
            
            //Time Stuff like
            //(calender/days)
            Text("Enter Duration of Competition")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.Gray)
            
            DatePicker("End Date", selection: $enddate)
            
        //Button that takes you to the competition
            
        }
       
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}
