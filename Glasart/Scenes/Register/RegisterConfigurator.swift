//
//  RegisterConfigurator.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class RegisterConfigurator {
    
    public init() {}
    
    public func create() -> RegisterViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = RegisterViewController()

        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        let interactor = RegisterInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
