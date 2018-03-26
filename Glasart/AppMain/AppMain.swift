//
//  AppMain.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class AppMainRouter {
    
    public static let instance          : AppMainRouter = AppMainRouter()
    fileprivate var window              : UIWindow!
    
    func gotoInsideApp(using window:UIWindow) {
        DispatchQueue.main.async {
            //guard let viewController = try? NewDevicesListConfigurator().createNavigator() else { return }
            //guard let viewController = try? EquipmentNamingConfigurator().create(equipment: nil) else { return }
            guard let viewController = try? LoginConfigurator().createNavigation() else { return }
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
}
