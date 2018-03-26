//
//  RegisterPresenter
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class RegisterPresenter {
    
    fileprivate weak var view   : RegisterView?
    fileprivate var interactor  : RegisterInput?
    fileprivate var router      : RegisterWireframe?
    
    public init() {}
    
    public func inject(view: RegisterView?, interactor:RegisterInput?, router:RegisterWireframe?) {
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
extension RegisterPresenter : RegisterModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
    
    public func alreadyRegistered() {
        router?.gotoLogin()
    }
}

// MARK: - Output Interactor Delegate
extension RegisterPresenter : RegisterOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
