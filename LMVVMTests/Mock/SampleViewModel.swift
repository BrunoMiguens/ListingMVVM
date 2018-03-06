//
//  SampleViewModel.swift
//  LMVVMTests
//
//  Created by bruno.miguens on 06/03/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import Foundation

class SampleViewModel {
    
    fileprivate let identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}

extension SampleViewModel {
    
    var id: Int {
        return identifier
    }

}
