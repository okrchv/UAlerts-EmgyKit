//
//  AlertTrackingAttributes.swift
//  UAlerts EmgyKit
//
//  Created by Oleh Kiurchev on 09.08.2023.
//

import Foundation
import ActivityKit

struct AlertTrackingAttributes: ActivityAttributes {
    public typealias AlertTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var alertStart: Date
    }
}
