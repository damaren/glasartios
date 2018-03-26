//
//  AppMainPresenter
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class AppMainPresenter {
    
    fileprivate weak var view   : AppMainView?
    fileprivate var interactor  : AppMainInput?
    fileprivate var router      : AppMainWireframe?
    
    public init() {}
    
    public func inject(view: AppMainView?, interactor:AppMainInput?, router:AppMainWireframe?) {
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
extension AppMainPresenter : AppMainModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
}

// MARK: - Output Interactor Delegate
extension AppMainPresenter : AppMainOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
