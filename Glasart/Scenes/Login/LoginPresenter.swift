//
//  LoginPresenter
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import Foundation

public class LoginPresenter {
    
    fileprivate weak var view   : LoginView?
    fileprivate var interactor  : LoginInput?
    fileprivate var router      : LoginWireframe?
    
    public init() {}
    
    public func inject(view: LoginView?, interactor:LoginInput?, router:LoginWireframe?) {
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
extension LoginPresenter : LoginModule {
    public func doSomething() {
        assertDependencies()
        //Implements presenter actions here
    }
    
    public func login(email: String, password: String) {
        if (email == "admin" && password == "admin") {
            router?.gotoInsideApp()
        }
    }
    
    public func forgotPassword() {
        
    }
    
    public func register() {
        router?.gotoRegister()
    }
}

// MARK: - Output Interactor Delegate
extension LoginPresenter : LoginOutput {
    public func fetch(something: String) {
        assertDependencies()
        //Handle fetched data here
    }
}
