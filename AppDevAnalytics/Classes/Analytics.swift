//
//  Analytics.swift
//  AppDevAnalytics
//
//  Created by Kevin Chan on 9/4/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import FirebaseAnalytics

protocol Event {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

extension Event {
    var parameters: [String: Any]? {
        nil
    }
}

class AppDevAnalytics {

    static let shared = AppDevAnalytics()

    private init() {}

    func logEvent(_ event: Event) {
        #if !DEBUG
        Analytics.logEvent(event.name, parameters: event.parameters)
        #else
        print("[Debug]: Logged event: \(event.name), parameters: \(event.parameters?.description ?? "nil")")
        #endif
    }

}
