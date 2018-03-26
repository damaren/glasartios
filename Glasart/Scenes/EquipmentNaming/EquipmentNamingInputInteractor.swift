//
//  EquipmentNamingInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class EquipmentNamingInputInteractor {
    
    fileprivate weak var output : EquipmentNamingOutput?
    
    public func inject(output:EquipmentNamingOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension EquipmentNamingInputInteractor : EquipmentNamingInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
