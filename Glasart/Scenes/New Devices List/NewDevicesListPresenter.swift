//
//  NewDevicesListPresenter
//  Glasart
//
//  Created by Damaren on 08/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class NewDevicesListPresenter {
    
    fileprivate weak var view   : NewDevicesListView?
    fileprivate var interactor  : NewDevicesListInput?
    fileprivate var router      : NewDevicesListWireframe?
    
    public init() {}
    
    public func inject(view: NewDevicesListView?, interactor:NewDevicesListInput?, router:NewDevicesListWireframe?) {
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
extension NewDevicesListPresenter : NewDevicesListModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
}

// MARK: - Output Interactor Delegate
extension NewDevicesListPresenter : NewDevicesListOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
