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
    var startDate = Date()
    var id = UUID()
    @Published var competitors: [String : Int] = [String:Int]() //dictionary
    
    init(compName: String = "", competitors: [String:Int] = [String:Int]()){
        
        self.compName = compName
        self.competitors = competitors
        
        //FirebaseFunctions.getAuthenticatedUser(self)
    }
    
    func dataAsDictionary() -> [String: Any]{
        
        var data: [String: Any] = [String: Any]()
        
        data["compName"] = compName
        data["endDate"] = endDate
        data["startDate"] = startDate
        data["uid"] = id.uuidString
        
        var competitors = [String: Any]()
        
//        for competitor in self.competitors{
//
//            competitors[competitor.id.uuidString] = competitor.dataAsDictionary()
//
//        }
        
        
        
        data["competitors"] = competitors
        
        
        
        return data
        
    }
    
    
}

func clear(CompetitionInfo: CompetitionInfo){
    CompetitionInfo.compName = ""
}

