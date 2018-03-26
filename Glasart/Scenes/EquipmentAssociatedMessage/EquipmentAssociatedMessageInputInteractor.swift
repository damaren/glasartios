//
//  EquipmentAssociatedMessageInputInteractor.swift
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class EquipmentAssociatedMessageInputInteractor {
    
    fileprivate weak var output : EquipmentAssociatedMessageOutput?
    
    public func inject(output:EquipmentAssociatedMessageOutput?) {
        self.output = output
    }

    private func assertDependencies() {
   		assert(output != nil, "Did not set output to the input interactor")
    }

}

// MARK: - Input Interactor
extension EquipmentAssociatedMessageInputInteractor : EquipmentAssociatedMessageInput {
    
    public func get(something:String) {
        assertDependencies()
        //Implement how to get data here
    }
    
}
