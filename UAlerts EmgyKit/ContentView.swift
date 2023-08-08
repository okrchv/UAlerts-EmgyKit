//
//  ContentView.swift
//  UAlerts EmgyKit
//
//  Created by Oleh Kiurchev on 02.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlert: Bool = false
        
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
