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
    
    public init() {}
    
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
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
}

// MARK: - Output Interactor Delegate
extension EquipmentAssociatedMessagePresenter : EquipmentAssociatedMessageOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
