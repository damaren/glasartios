//
//  RegisterInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class RegisterInputInteractor {
    
    fileprivate weak var output : RegisterOutput?
    
    public func inject(output:RegisterOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension RegisterInputInteractor : RegisterInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
