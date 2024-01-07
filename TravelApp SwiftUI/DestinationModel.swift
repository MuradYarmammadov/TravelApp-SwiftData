//
//  DestinationModel.swift
//  TravelApp SwiftUI
//
//  Created by Murad Yarmamedov on 07.01.24.
//

import Foundation
import SwiftData

@Model
class DestinationModel {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade)  var sights = [SightModel]()
    
    init(name: String  = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
