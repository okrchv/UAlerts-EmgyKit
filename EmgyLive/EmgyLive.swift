//
//  EmgyLive.swift
//  EmgyLive
//
//  Created by Oleh Kiurchev on 02.08.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EmgyLive: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AlertTrackingAttributes.self) { context in
            AlertTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("MAIN")
                }
            } compactLeading: {
                Text("CL")
            } compactTrailing: {
                Text("CT")
            } minimal: {
                Text("min")
            }

        }
    }
}

struct AlertTrackingWidgetView: View {
    let context: ActivityViewContext<AlertTrackingAttributes>
    
    var body: some View {
        Text(context.state.alertStart, style: .timer)
    }
}


