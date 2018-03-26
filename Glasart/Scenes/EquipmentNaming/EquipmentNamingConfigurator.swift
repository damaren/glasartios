//
//  EquipmentNamingConfigurator.swift
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentNamingConfigurator {
    
    public init() {}
    
    public func create() -> EquipmentNamingViewController {
        
//        Use this implementation
//        guard let viewController = StoryboardIdentifier.authentication.storyboard?.instantiateViewController(withIdentifier: "EquipmentNamingViewController") as? EquipmentNamingViewController else {
//            return
//        }
//        
//        OR
//        User this another one
        let viewController = EquipmentNamingViewController()

        let presenter = EquipmentNamingPresenter()
        let router = EquipmentNamingRouter()
        let interactor = EquipmentNamingInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
