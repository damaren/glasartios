//
//  ModelSelectionInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class ModelSelectionInputInteractor {
    
    fileprivate weak var output : ModelSelectionOutput?
    
    public func inject(output:ModelSelectionOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension ModelSelectionInputInteractor : ModelSelectionInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
