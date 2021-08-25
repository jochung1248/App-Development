//
//  UniversePortfolioData.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import Foundation
import SwiftUI
import CoreLocation

/*
struct UniversePortfolioData: Codable, Identifiable {

    var id: String = UUID().uuidString
    var price: CGFloat
    
}
*/

struct Account: Identifiable {
    var id: Int
    var name: String
    var balance: Double
    var earnings: Double
}

let Joseph = Account(id: 1, name: "Joseph Chung", balance: 380.00, earnings: 80.40)

/*
struct UniversePortfolioData {
    static let oneMonth: [CGFloat] = [
        0.02, 0.06, 0.10, 0.04, 0.05, 0.06, 0.08, 0.07, 0.09, 0.13
    ]
}
 
var collectedData = [UniversePortfolioData]()
*/



//let filteredData = UniversePortfolioData.oneMonth.filter({$0 < 2.0})


