//
//  EquipmentAssociatedMessagePresenter
//  Glasart
//
//  Created by Damaren on 19/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class EquipmentAssociatedMessagePresenter {
    
    fileprivate weak var view   : EquipmentAssociatedMessageView?
    fileprivate var interactor  : EquipmentAssociatedMessageInput?
    fileprivate var router      : EquipmentAssociatedMessageWireframe?
    
    public var equipment:Equipment?
    
    private func mock() {
        var equipment:Equipment = Equipment()
        equipment.description = ""
        equipment.name = ""
        let info = EquipmentInfo(width: 450, height: 450, power: 418)
        equipment.info = info
        self.equipment = equipment
    }
    
    public init() {
        mock()
    }
    
    public func inject(view: EquipmentAssociatedMessageView?, interactor:EquipmentAssociatedMessageInput?, router:EquipmentAssociatedMessageWireframe?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func assertDependencies() {
        assert(view != nil, "No view defined in presenter")
        assert(interactor != nil, "No interactor defined in presenter")
        assert(router != nil, "No router defined in presenter")
    }
    
}

// MARK: - Presenter Delegates
extension EquipmentAssociatedMessagePresenter : EquipmentAssociatedMessageModule {
    public func getEquipment() {
        assertDependencies()
        //Implements presenter actions here
        view?.show(equipment: self.equipment)
    }
}

// MARK: - Output Interactor Delegate
extension EquipmentAssociatedMessagePresenter : EquipmentAssociatedMessageOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
