//
//  Mission.swift
//  Moonshot
//
//  Created by admin on 9/6/22.
//

import Foundation
struct Mission: Codable, Identifiable {
    struct CrewRole : Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String  {
        "Appolo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
