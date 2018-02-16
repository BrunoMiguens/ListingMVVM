//
//  DataViewModel.swift
//  BuddyBook
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 29/01/18.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit

public class DataViewModel<V> {

    fileprivate var source: [V]

    public init(source: [V]) {
        self.source = source
    }

}

extension DataViewModel {

    public var count: Int {
        return source.count
    }

    public func index(of index: Int) -> V? {
        guard source.count > 0 && index >= 0 && index < source.count else {
            return nil
        }

        return source[index]
    }

    public func add(object: V, at index: Int?) {
        guard let idx = index, idx >= 0 && idx < source.count else {
            source.append(object)
            return
        }

        return source.insert(object, at: idx)
    }

    public func remove(at index: Int) {
        guard source.count > 0 && index >= 0 && index < source.count else {
            return
        }

        source.remove(at: index)
    }

}
