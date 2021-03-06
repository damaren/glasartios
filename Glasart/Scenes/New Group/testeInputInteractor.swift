//
//  testeInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class testeInputInteractor {
    
    fileprivate weak var output : testeOutput?
    
    public func inject(output:testeOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension testeInputInteractor : testeInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
