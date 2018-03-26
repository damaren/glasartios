//
//  ModelSelectionPresenter
//  Glasart
//
//  Created by Damaren on 16/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class ModelSelectionPresenter {
    
    fileprivate weak var view   : ModelSelectionView?
    fileprivate var interactor  : ModelSelectionInput?
    fileprivate var router      : ModelSelectionWireframe?
    
    public init() {}
    
    public func inject(view: ModelSelectionView?, interactor:ModelSelectionInput?, router:ModelSelectionWireframe?) {
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
extension ModelSelectionPresenter : ModelSelectionModule {
    public var equipmentsInfo:[EquipmentInfo] {
        var list:[EquipmentInfo] = []
        list.append(EquipmentInfo(width: 450, height: 450, power: 418))
        list.append(EquipmentInfo(width: 600, height: 400, power: 777))
        return list
    }
}

// MARK: - Output Interactor Delegate
extension ModelSelectionPresenter : ModelSelectionOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
