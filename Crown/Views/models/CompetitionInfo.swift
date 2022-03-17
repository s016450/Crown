//
//  CompetitionInfo.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import Foundation

class CompetitionInfo: ObservableObject{
    var compName: String
<<<<<<< HEAD:Crown/CompetitionInfo.swift
    var compPoints: String
   
    init(compName: String = "", compPoints: String = ""){
=======
    var endDate = Date()
    var id = UUID()

    init(compName: String = ""){
>>>>>>> main:Crown/Views/models/CompetitionInfo.swift
     
        self.compName = compName
        self.compPoints = compPoints
         
        //FirebaseFunctions.getAuthenticatedUser(self)
    }
}
 
func clear(CompetitionInfo: CompetitionInfo){
    CompetitionInfo.compName = ""
}
