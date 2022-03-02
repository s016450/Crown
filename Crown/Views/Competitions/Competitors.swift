//
//  Competitors.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/2/22.
//

import SwiftUI

struct Competitors: View {
    
    @State private var competitors : [CompetitorInfo] =
        [CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" ")]
    
    
    var body: some View {
       Text("Hello world")
}
    
}

struct Competitors_Previews: PreviewProvider {
    static var previews: some View {
        Competitors()
    }
}
