//
//  AnalyticEvent.swift
//  Logging
//
//  Created by Connor Black on 21/06/2025.
//

import FirebaseAnalytics
import Foundation

public struct AnalyticEvent: LoggableEvent {
    let key: String
    let parameters: [String: Any]

    public init(key: String, parameters: [String: Any] = [:]) {
        self.key = key
        self.parameters = parameters
    }

    public func log() {
        FirebaseAnalytics.Analytics.logEvent(key, parameters: parameters)
    }
}

public struct ErrorEvent: LoggableEvent {
    let key: String = "Error"
    let error: Error

    public init(error: Error) {
        self.error = error
    }

    public func log() {
        FirebaseAnalytics.Analytics.logEvent(
            key,
            parameters: [
                "error": error,
                "message": error.localizedDescription,
            ]
        )
    }
}

public protocol LoggableEvent {
    public func log()
}

public enum Analytics {
    public static func appOpen() -> AnalyticEvent {
        AnalyticEvent(key: AnalyticsEventAppOpen)
    }

    public static func login() -> AnalyticEvent {
        AnalyticEvent(key: AnalyticsEventLogin)
    }

    public static func logout() -> AnalyticEvent {
        AnalyticEvent(key: "logout")
    }

    public static func createAuth() -> AnalyticEvent {
        AnalyticEvent(key: AnalyticsEventSignUp)
    }

    public static func onboardingCompleted() -> AnalyticEvent {
        AnalyticEvent(key: "onboarding_completed")
    }

    public static func profileCreated() -> AnalyticEvent {
        AnalyticEvent(key: "profile_created")
    }

    public static func error(error: Error) -> ErrorEvent {
        ErrorEvent(error: error)
    }
}
