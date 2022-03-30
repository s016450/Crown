//
//  Competitors.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/15/22.
//

import Foundation

struct Competitors : Identifiable{
    
    var user : String
    var points : Int
    var id = UUID()
    
    
    init(user : String , points : Int ){
        self.user = user
        self.points = points
        
    }
    

    func dataAsDictionary() -> [String: Any]{
        
        var data: [String: Any] = [String: Any]()
        
        data["user"] = user
        data["points"] = points
        data["uid"] = id.uuidString
        
        return data
        
    }//end function
    
}
