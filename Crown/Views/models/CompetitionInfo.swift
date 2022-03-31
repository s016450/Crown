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
    var points : String
    var endDate = Date()
    var startDate = Date()
    var competitorId = UUID()
    @Published var competitors: [Competitors] = [Competitors]() //an array
    
    init(compName: String = "", points: String = "",competitors: [Competitors] = [Competitors]()){
        
        self.compName = compName
        self.points = points
        self.competitors = competitors
        
        //FirebaseFunctions.getAuthenticatedUser(self)
    }
    
    func dataAsDictionary() -> [String: Any]{
        
        var data: [String: Any] = [String: Any]()
        
        data["compName"] = compName
        data["points"] = points
        data["endDate"] = endDate
        data["startDate"] = startDate
        data["uid"] = competitorId.uuidString
        
        var Competitor = [String: Any]()
        
        for Competitors in self.competitors{
            
            Competitor[Competitors.id.uuidString] = Competitors.dataAsDictionary()
            
        }
        
        data["Competitor"] = Competitor
        
        return data
        
    }
    
    
}

func clear(CompetitionInfo: CompetitionInfo){
    CompetitionInfo.compName = ""
}

