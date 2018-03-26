//
//  NewDevicesListInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class NewDevicesListInputInteractor {
    
    fileprivate weak var output : NewDevicesListOutput?
    
    public func inject(output:NewDevicesListOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension NewDevicesListInputInteractor : NewDevicesListInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
