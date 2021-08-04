//
//  Message.swift
//  StickyHeader
//
//  Created by user on 04/08/2021.
//

import Foundation
import SwiftUI

struct Project: Hashable {
    let name: String
    let shortDescription: String
    let tintColor: Color
}


let projects: [Project] = [
    Project(name: "Pulse", shortDescription: "Mobile app to manage SNMP enable device via SNMP Protocol", tintColor: .blue),
    Project(name: "Swiper", shortDescription: "One of the first target digital advertisement on Mobile Device", tintColor: .red),
    Project(name: "KoolKat", shortDescription: "One of the fastest food delivery app on iOS and Android", tintColor: .orange),
    Project(name: "Bursa", shortDescription: "BursaMKTPLC is everything investors & traders need in one comprehensive destination. Market data, stock ratings, analysis, investing & trading tools.", tintColor: .black),
    Project(name: "iVisit", shortDescription: "Tool to manage sales representative, make plan and marketing ", tintColor: .blue),
    Project(name: "Product Showcase", shortDescription: "Unique way to display and show case your product in 360 degree", tintColor: .green),
    Project(name: "zConnect", shortDescription: "zConnect empowers users by helping them get a comprehensive insight into their health, healthcare access and benefits-related information.", tintColor: .blue)
    
    
    
]
