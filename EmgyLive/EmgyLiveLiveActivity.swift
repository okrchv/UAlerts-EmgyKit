//
//  EmgyLiveLiveActivity.swift
//  EmgyLive
//
//  Created by Oleh Kiurchev on 02.08.2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EmgyLiveAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct EmgyLiveLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EmgyLiveAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension EmgyLiveAttributes {
    fileprivate static var preview: EmgyLiveAttributes {
        EmgyLiveAttributes(name: "World")
    }
}

extension EmgyLiveAttributes.ContentState {
    fileprivate static var smiley: EmgyLiveAttributes.ContentState {
        EmgyLiveAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: EmgyLiveAttributes.ContentState {
         EmgyLiveAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: EmgyLiveAttributes.preview) {
   EmgyLiveLiveActivity()
} contentStates: {
    EmgyLiveAttributes.ContentState.smiley
    EmgyLiveAttributes.ContentState.starEyes
}
