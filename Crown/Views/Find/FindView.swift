//
//  FindView.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/15/22.
//

import SwiftUI

struct FindView: View {
    
    @State var search: String = ""
    
    var body: some View {
        VStack{
            Text("Discover")
                .font(.system(size: 35, weight: .heavy))
                .foregroundColor(Color.Gray)
                .padding(.top, 30)
            
            TextField("Search", text: $search)
                .frame(maxWidth: 300,
                       minHeight: 44)
                .padding(.leading, 45)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .foregroundColor(Color.Gray.opacity(0.5))
                .background(
                    
                    ZStack(alignment: .leading){
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 10)
                            .foregroundColor(Color.Gray.opacity(0.5))
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.Gray.opacity(0.5))
                            .frame(maxWidth: 410)
                    }
                )
                        
            ScrollView(showsIndicators: false){
                
                NavigationLink(destination: {
                    WCDView()
                }, label: {
                    VStack{
                        
                        Text("Winterfest Can Drive")
                            .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(Color.Gray)
                        
                        Text("Leaderboard")
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(Color.Gray)
                            .padding(.top)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Mr. Elder - 213")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Blu)
                                    .frame(width: 213, height: 25)
                                
                                Text("Mrs. Sweeney - 170")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Blu)
                                    .frame(width: 170, height: 25)
                                
                                Text("Mr. Swope - 129")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Blu)
                                    .frame(width: 129, height: 25)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .padding(.horizontal, 10)
                        
                        
                    }
                })
                
                NavigationLink(destination: {
                    MDView()
                }, label: {
                    VStack{
                        
                        Text("Martia Dementia MMXXII")
                            .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(Color.Gray)
                        
                        Image("Bracket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .padding(.horizontal, 10)
                    }
                })
                
                NavigationLink(destination: {
                    AMView()
                }, label: {
                    VStack{
                        
                        Text("April Meterboard")
                            .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .center)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(Color.Gray)
                        
                        Text("Leaderboard")
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(Color.Gray)
                            .padding(.top)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Max - 63,000")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Red)
                                    .frame(width: 300, height: 25)
                                
                                Text("Charlie - 38,656")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Red)
                                    .frame(width: 184, height: 25)
                                
                                Text("Isaac - 36,054")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(Color.Red)
                                    .frame(width: 171, height: 25)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .padding(.horizontal, 10)
                        
                        
                    }
                })
            }
        }
        .ignoresSafeArea()
        .accentColor(Color.Gray)
    }
}


struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
