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
    
    public func getEquipments() {
        assertDependencies()
        NSLog("Interactor - Buscando equipamentos")
        //Implement how to get data here
        let list = mock()
        output?.fetch(equipments:list)
    }
    
    func mock() -> [Equipment] {
        var equipments:[Equipment] = []
        var a = Equipment()
        a.name = "Equip1"
        a.description = "Buffet1"
        var b = Equipment()
        b.name = "Equip2"
        b.description = "Buffet2"
        equipments.append(a)
        equipments.append(b)
        return equipments
    }
    
}
