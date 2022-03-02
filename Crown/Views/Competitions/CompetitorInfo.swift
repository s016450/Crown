//
//  CompetitorInfo.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/2/22.
//

import Foundation

struct CompetitorInfo : Identifiable{
    
    var name : String
    var id = UUID()
    
    init(name : String = "User"){
        self.name = name
    }
    
}
