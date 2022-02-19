//
//  File.swift
//  
//
//  Created by Daniel Fortesque on 19/02/22.
//

import Foundation

extension Array where Element == Data {
    func merge() -> Data {
        return reduce(into: Data()) { $0.append($1) }
    }
}
