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
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(Color.Purple)
                
                TextField("Competition Name", text:  $competitionInfo.compName)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .padding(.leading, 30)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                                
                //Users Info
                Text("Enter The Competitors")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Purple)
                //use an array to add users
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                //Time Stuff like
                //(calender/days)
                Text("Enter Duration of Competition")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.Gray)
                
                DatePicker("End Date", selection: $enddate)
                    .foregroundColor(.Purple)
                
                //Button that takes you to the time competition
                //Navigation View
                Spacer(minLength: 0)
                NavigationLink(
                    destination: TimeCompView(),
                    label: {
                        Text("Create Competetion")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.Purple)
                            .background(Color.Yellow)
                            .cornerRadius(15.0)
                    })
                Spacer(minLength: 0)
            }
            
            
            
        }
        
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}
