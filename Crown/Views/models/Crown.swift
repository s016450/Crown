//
//  Crown.swift
//  Crown
//
//  Created by Jonathan  Miller  on 4/23/22.
//

import SwiftUI

class Crown: Identifiable {
    @Published var name: String
    @Published var type: String
    
    init(name : String, type: String ){
        self.name = name
        self.type = type
    }
}
