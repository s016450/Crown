//
//  CompetitionInfo.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import Foundation

class CompetitionInfo: ObservableObject{
    var compName: String
    var endDate = Date()
    var id = UUID()

    init(compName: String = ""){
     
        self.compName = compName
         
        //FirebaseFunctions.getAuthenticatedUser(self)
    }
}
 
func clear(CompetitionInfo: CompetitionInfo){
    CompetitionInfo.compName = ""
}
