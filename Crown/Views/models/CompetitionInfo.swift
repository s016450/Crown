//
//  CompetitionInfo.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import Foundation
import FirebaseFirestore

class CompetitionInfo: ObservableObject{
    var compName: String
    var endDate = Date()
    var id = UUID()
    @Published var competitors: [String : Int] = [String:Int]() //dictionary

    init(compName: String = "", competitors: [String:Int] = [String:Int]()){
     
        self.compName = compName
        self.competitors = competitors
         
        //FirebaseFunctions.getAuthenticatedUser(self)
    }
   
}

func clear(CompetitionInfo: CompetitionInfo){
    CompetitionInfo.compName = ""
}

