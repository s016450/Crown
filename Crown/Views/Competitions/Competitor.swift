//
//  Competitor.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/4/22.
//

import SwiftUI

struct Competitor: View {
    
    @State var competitors : [CompetitorInfo] =
        
        [CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" ")]
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Competitor_Previews: PreviewProvider {
    static var previews: some View {
        Competitor()
    }
}
