//
//  LoginNavigator.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 3/8/22.
//

import Foundation


enum Page{
    case home
    case timeCreate
    case pointCreate
    case backetCreate
}

class LoginNavigator: ObservableObject{
    @Published var currentPage: Page = Page.home
}
