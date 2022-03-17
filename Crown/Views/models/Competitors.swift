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
    
    init(user : String = "User", points : Int ){
        self.user = user
        self.points = points
        
    }
    
}
