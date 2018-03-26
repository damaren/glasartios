//
//  testeConfigurator.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class testeConfigurator {
    
    public init() {}
    
    public func create() -> testeViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "testeViewController") as? testeViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = testeViewController()

        let presenter = testePresenter()
        let router = testeRouter()
        let interactor = testeInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
