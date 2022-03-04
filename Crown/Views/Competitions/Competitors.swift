//
//  Competitors.swift
//  Crown
//
//  Created by Maya Ringold (student LM) on 3/4/22.
//

import SwiftUI

struct Competitors: View {
    
    @State var competitors : [CompetitorInfo] =
      
        [CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" "),
         CompetitorInfo(name:" ")]
        
        var body: some View {
           Text("Competetitors")
        }
    }

struct Competitors_Previews: PreviewProvider {
    static var previews: some View {
        Competitors()
    }
}
