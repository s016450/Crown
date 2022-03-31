//
//  tabview.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/9/22.
//

import SwiftUI

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

struct tabview: View {
    
    @State private var selectedIndex = 0
    let tabViewImageNames = ["house", "magnifyingglass", "plus.app", "rosette", "person"]
    let clickedTabViewImageNames = ["house.fill", "magnifyingglass", "plus.app.fill", "rosette",  "person.fill"]
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.Gray)
    }
    
    var body: some View {
        VStack{
            ZStack{
                switch selectedIndex{
                
                case 0:
                    NavigationView{
                        HomeView()
                    }
                case 1:
                    NavigationView{
                        FindView()
                    }
                    .ignoresSafeArea()
                case 2:
                    NavigationView{
                        CompetitionChooserView()
                    }
                case 4:
                    NavigationView{
                        AccountView()
                    }
                default:
                    NavigationView{
                        HomeView()
                    }
                }
            }
            .ignoresSafeArea()
            .padding(.top, 50)

            
            Spacer()
            ZStack{
                Spacer()
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width, height: 100)
                    .foregroundColor(Color.Gray)
                HStack{
                    ForEach(0..<5){ num in
                        Button(action: {
                            selectedIndex  = num
                        }, label: {
                            Spacer()
                            Image(systemName: selectedIndex == num ? clickedTabViewImageNames[num] : tabViewImageNames[num])
                                .foregroundColor(selectedIndex == num ? Color.Yellow : .gray)
                                .font(.system(size: 24, weight: .bold))
                            Spacer()
                        })
                    }
                }
            }
        }
        .accentColor(.Yellow)
        .ignoresSafeArea(.all)
    }
}

struct tabview_Previews: PreviewProvider {
    static var previews: some View {
        tabview()
    }
}