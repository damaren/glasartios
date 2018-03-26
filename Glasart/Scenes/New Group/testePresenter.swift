//
//  testePresenter
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class testePresenter {
    
    fileprivate weak var view   : testeView?
    fileprivate var interactor  : testeInput?
    fileprivate var router      : testeWireframe?
    
    public init() {}
    
    public func inject(view: testeView?, interactor:testeInput?, router:testeWireframe?) {
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
extension testePresenter : testeModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
}

// MARK: - Output Interactor Delegate
extension testePresenter : testeOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
