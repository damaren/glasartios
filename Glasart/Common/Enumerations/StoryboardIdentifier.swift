//
//  StoryboardIdentifier.swift
//  Glasart
//
//  Created by Damaren on 06/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public enum StoryboardIdentifier : String {
    case authentication = "Authentication"
    case deviceManager = "DeviceManager"
    
    public var storyboard : UIStoryboard? {
        let sb = UIStoryboard(name: self.rawValue, bundle: nil)
        return sb
    }
    
}
