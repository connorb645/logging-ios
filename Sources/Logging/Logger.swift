//
//  Logger.swift
//  Logging
//
//  Created by Connor Black on 31/07/2024.
//

import Foundation
import Pulse

public typealias LoggerURLSessionProtocol = URLSessionProtocol & Sendable
public enum URLSessionProvider {
    public static let session: LoggerURLSessionProtocol = URLSessionProxy(configuration: .default)
}
