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
//let session: URLSessionProtocol = URLSessionProxy(configuration: .default)

//public struct Logger {
//    public static func enableAutomaticRegistration() {
//        URLSessionProxyDelegate.enableAutomaticRegistration()
//    }
//}
//
//public protocol URLSessionProtocol {
//    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
//}
//
//public class URLSessionPulse: URLSessionProtocol {
//    let session: URLSession
//    let networkLogger: NetworkLogger
//
//    public init(session: URLSession) {
//        self.session = session
//        self.networkLogger = NetworkLogger()
//    }
//
//    public func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        var task: URLSessionDataTask?
//        let onReceive: @Sendable (Data?, URLResponse?, Error?) -> Void = { (data, response, error) in
//            if let task {
//                if let data {
//                    self.networkLogger.logDataTask(task, didReceive: data)
//                }
//                self.networkLogger.logTask(task, didCompleteWithError: error)
//            }
//        }
//
//        task = session.dataTask(with: request) { data, response, error in
////            onReceive(data, response, error)
//
//            completionHandler(data, response, error)
//        }
//        if let task {
//            self.networkLogger.logTaskCreated(task)
//        }
//        return task!
//    }
//}
