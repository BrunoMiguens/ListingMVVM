//
//  Binding.swift
//  BuddyBook
//
//  Created by bruno.miguens on 30/01/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit

public class Binding<B> {

    public typealias BindingListener = (B) -> Void

    fileprivate var listener: BindingListener?

    public var value: B {
        didSet {
            listener?(value)
        }
    }

    public init(value: B) {
        self.value = value
    }

    public func bind(handler: BindingListener?) {
        self.listener = handler
        listener?(value)
    }

}
