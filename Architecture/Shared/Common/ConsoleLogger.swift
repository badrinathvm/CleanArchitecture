//
//  ConsoleLogger.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

struct ConsoleLogger: LoggerInterface {
    func logInfo(_ message: String) {
        print("🔍 [CONSOLE] \(message)")
    }
    
    func logError(_ message: String) {
        print("🔍 [CONSOLE:Error] \(message)")
    }

}
