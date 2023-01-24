//
//  Dynamic.swift
//  PSMVVM_001
//
//  Created by Marcelo Sampaio on 23/01/23.
//

import Foundation

struct Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    mutating func bind(callback: @escaping (T) -> Void) {
        listener = callback
    }
    
    init(_ value: T) {
        self.value = value
    }
}
