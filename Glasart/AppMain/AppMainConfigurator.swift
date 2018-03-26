//
//  AppMainConfigurator.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class AppMainConfigurator {
    
    public init() {}
    
    public func create() -> AppMainViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "AppMainViewController") as? AppMainViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = AppMainViewController()

        let presenter = AppMainPresenter()
        let router = AppMainRouter()
        let interactor = AppMainInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
