//
//  SampleCollectionCell.swift
//  LMVVMTests
//
//  Created by bruno.miguens on 06/03/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import UIKit
@testable import LMVVM

class SampleCollectionCell: UICollectionViewCell, GenericCellProtocol {
    
    typealias ModelType = SampleViewModel
    
    internal var viewModel: SampleViewModel?
    
}
