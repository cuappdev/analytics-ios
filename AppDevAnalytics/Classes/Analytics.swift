//
//  Analytics.swift
//  AppDevAnalytics
//
//  Created by Kevin Chan on 9/4/19.
//  Copyright © 2019 Kevin Chan. All rights reserved.
//

import FirebaseAnalytics

public protocol Event {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

public extension Event {
    var parameters: [String: Any]? {
        nil
    }
}

public class AppDevAnalytics {

    static public let shared = AppDevAnalytics()

    private init() {}

    static public func logEvent(_ event: Event) {
        #if !DEBUG
        Analytics.logEvent(event.name, parameters: event.parameters)
        #else
        print("[Debug]: Logged event: \(event.name), parameters: \(event.parameters?.description ?? "nil")")
        #endif
    }

}
