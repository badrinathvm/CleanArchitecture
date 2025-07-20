//
//  ConsoleLogger.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

struct ConsoleLogger: LoggerInterface {
    func log(_ message: String) {
        print("🔍 [CONSOLE] \(message)")
    }
}
