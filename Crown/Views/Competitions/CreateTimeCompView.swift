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
   // @EnvironmentObject var competetitionInfo : CompetitionInfo
    @StateObject var competitionInfo : CompetitionInfo = CompetitionInfo()
    
    //@StateObject var userInfo : UserInfo() = UserInfo()

    var body: some View {
        NavigationView{
            VStack{
                Text("New Time Competition")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color.Purple)
                Spacer()
                
                TextField("Competition Name", text:  $competitionInfo.compName)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .padding(.leading, 30)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                
                Spacer()
                
                //Users Info
                Text("Enter The Competitors")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Purple)
                //use an array to add users
                
                Spacer()
                
                //Time Stuff like
                //(calender/days)
                Text("Enter Duration of Competition")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                
                DatePicker("End Date", selection: $enddate)
                    .foregroundColor(.Purple)
                
                //Button that takes you to the time competition
                //Navigation View
                
                NavigationLink(
                    destination: TimeCompView(),
                    label: {
                        Text("Create Competetion")
                            .foregroundColor(.Purple)
                    })
            }
            
            
            
        }
        
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}
