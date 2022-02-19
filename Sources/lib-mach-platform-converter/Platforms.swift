//
//  File.swift
//  
//
//  Created by Daniel Fortesque on 19/02/22.
//

import Foundation

// from: https://github.com/apple/darwin-xnu/blob/2ff845c2e033bd0ff64b5b6aa6063a1f8f65aa32/EXTERNAL_HEADERS/mach-o/loader.h#L1276

public enum Platform: Int32, CaseIterable {
    case MACOS = 1
    case IOS = 2
    case TVOS = 3
    case WATCHOS = 4
    case BRIDGEOS = 5
    case MACCATALYST = 6
    case IOSSIMULATOR = 7
    case TVOSSIMULATOR = 8
    case WATCHOSSIMULATOR = 9
    case DRIVERKIT = 10
}
