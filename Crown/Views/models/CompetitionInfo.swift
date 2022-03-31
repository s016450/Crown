//
//  CompetitionInfo.swift
//  Crown
//
//  Created by Sophia Weatherwax (student LM) on 3/1/22.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class CompetitionInfo: ObservableObject{
    var compName: String = ""
    @Published var backgroundColor: Color = Color.white
    @Published var titleColor: Color = Color.Gray
    @Published var barColor: Color = Color.Yellow
    var endDate = Date()
    var id = UUID()
    @Published var competitors: [String : Int]  //dictionary

    init(compName: String = "", competitors: [String:Int] = [String:Int]()){
     
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

