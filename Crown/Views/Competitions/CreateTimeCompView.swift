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
    
    //date picker stuff https://stackoverflow.com/questions/52984284/swift-save-uidatepicker-date-into-coredata
    
    var body: some View {
        NavigationView{
            VStack{
                Text("New Time Competition")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.Yellow)
                    .background(Color.Purple)
                    .padding(.top, 100)
                    .cornerRadius(10.0)
                
                
                TextField("Enter Competition Name", text:  $competitionInfo.compName)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .padding(.top, 40)
                    .padding(.leading , 10)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                
                //Users Info
                Text("Enter The Competitors")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                    .padding()
                //use an array to add users
                Spacer(minLength: 0)
                
                //Time Stuff like
                //(calender/days)
                Text("Enter Duration of Competition")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.Purple)
                
                DatePicker("Select End Date", selection: $enddate)
                    .foregroundColor(Color.Purple)
                    .padding()
                
                
                //Button that takes you to the time competition
                //Navigation View
                Spacer(minLength: 0)
                
                NavigationLink(
                    destination: TimeCompView(),
                    label: {
                        Text("Create Competetion")
                            .font(.system(size: 40, weight: .regular))
                            .foregroundColor(.Purple)
                            .border(Color.Yellow, width: 2)
                       
                        
                    }).padding()
                Spacer(minLength: 0)
            }.ignoresSafeArea(.all)
            
            
            
        }
        
    }
}

struct CreateTimeCompView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTimeCompView()
    }
}
