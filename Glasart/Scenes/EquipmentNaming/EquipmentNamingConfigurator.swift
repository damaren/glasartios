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
    
    public func create(equipment:Equipment?) -> EquipmentNamingViewController {
        
        guard let viewController = StoryboardIdentifier.deviceManager.storyboard?.instantiateViewController(withIdentifier: "EquipmentNamingViewController") as? EquipmentNamingViewController else {
            fatalError()
        }

        let presenter = EquipmentNamingPresenter(equipment: equipment)
        let router = EquipmentNamingRouter()
        let interactor = EquipmentNamingInputInteractor()
        
        presenter.inject(view: viewController, interactor: interactor, router: router)
        interactor.inject(output: presenter)
        viewController.inject(presenter: presenter)
        router.inject(viewController: viewController)
        
        return viewController
    }
    
}
