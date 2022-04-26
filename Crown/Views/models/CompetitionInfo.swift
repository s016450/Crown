//
//  CompetitionInfo.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class CompetitionInfo: Identifiable{
    var compName: String
    @Published var barColor: Color = Color.Yellow
    var startDate = Date()
    var endDate = Date()
    var competitorId = UUID()
    var points: Int? = nil
    @Published var competitors: [Competitors] = [Competitors]()

    init(compName: String = ""){
     
        self.compName = compName
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

