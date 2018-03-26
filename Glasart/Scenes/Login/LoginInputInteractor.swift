//
//  LoginInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class LoginInputInteractor {
    
    fileprivate weak var output : LoginOutput?
    
    public func inject(output:LoginOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension LoginInputInteractor : LoginInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
