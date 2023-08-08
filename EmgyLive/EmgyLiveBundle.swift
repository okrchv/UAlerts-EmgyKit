//
//  EmgyLiveBundle.swift
//  EmgyLive
//
//  Created by Oleh Kiurchev on 02.08.2023.
//

import WidgetKit
import SwiftUI

@main
struct EmgyLiveBundle: WidgetBundle {
    var body: some Widget {
        EmgyLive()
        EmgyLiveLiveActivity()
    }
}
