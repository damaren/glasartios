//
//  EquipmentNamingPresenter
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class EquipmentNamingPresenter {
    
    fileprivate weak var view   : EquipmentNamingView?
    fileprivate var interactor  : EquipmentNamingInput?
    fileprivate var router      : EquipmentNamingWireframe?
    
    public init() {}
    
    public func inject(view: EquipmentNamingView?, interactor:EquipmentNamingInput?, router:EquipmentNamingWireframe?) {
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
extension EquipmentNamingPresenter : EquipmentNamingModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
}

// MARK: - Output Interactor Delegate
extension EquipmentNamingPresenter : EquipmentNamingOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
