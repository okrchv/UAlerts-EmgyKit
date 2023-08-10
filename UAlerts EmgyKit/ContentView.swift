//
//  ContentView.swift
//  UAlerts EmgyKit
//
//  Created by Oleh Kiurchev on 02.08.2023.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isAlert: Bool = false
    @State private var alertStart: Date? = nil
    @State private var activity: Activity<AlertTrackingAttributes>? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            if let alertStart {
                HStack(spacing: 20) {
                    Text("Danger! 🚨")
                    
                    Text(alertStart, style: .timer)
                }
            } else {
                Text("All Good!")
            }
            Button {
                isAlert.toggle()
                
                if isAlert {
                    alertStart = .now
                    
                    // Live activity starts
                    
                    let attributes = AlertTrackingAttributes()
                    let state = AlertTrackingAttributes.ContentState(alertStart: .now)
                    
                    activity = try? Activity<AlertTrackingAttributes>.request(attributes: attributes, content: ActivityContent(state: state, staleDate: alertStart?.addingTimeInterval(60 * 5)), pushType: nil)
                } else {
                    // Live activity ends
                    guard let alertStart else { return }
                    let state = AlertTrackingAttributes.ContentState(alertStart: alertStart)
                    
                    Task {
                        await activity?.end(
                            ActivityContent(state: state, staleDate: .now.addingTimeInterval(60 * 2)),
                            dismissalPolicy: .immediate
                        )
                    }
                    
                    self.alertStart = nil
                }
            } label: {
                Text(isAlert ? "end" : "begin")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .buttonBorderShape(.capsule)
                    .background(Capsule().fill(isAlert ? .red : .green))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
