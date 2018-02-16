//
//  GenericCellProtocol.swift
//  BuddyBook
//
//  Created by bruno.miguens on 31/01/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit

public protocol GenericCellProtocol {

    associatedtype ModelType

    var viewModel: ModelType? { get set }

}
