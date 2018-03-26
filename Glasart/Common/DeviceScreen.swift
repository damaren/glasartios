//
//  DeviceScreen.swift
//  Glasart
//
//  Created by Damaren on 07/03/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

///
/// Device Screen Entity
///
public class DeviceScreen {
    
    /// Size of screen in native dimension
    public var nativeSize : CGSize {
        return UIScreen.main.nativeBounds.size
    }
    
    /// Size of screen in non native dimension
    public var screenSize : CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// Verify if screen is sized for iPhone
    public var isIphone : Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    /// iPhone SE, iPhone 5, iPhone 5c of iPhone 5s validation
    public var isIphoneSE : Bool {
        if !isIphone { return false }
        if nativeSize.height == 1136 { return true }
        return false
    }
    
    /// iPhone 6, iPhone 7 or iPhone 8 validation
    public var isIphone6 : Bool {
        if !isIphone { return false }
        if nativeSize.height == 1334 { return true }
        return false
    }
    
    /// iPhone 6+, iPhone 7+ or iPhone 8+ validation
    public var isIphone6Plus : Bool {
        if !isIphone { return false }
        if nativeSize.height == 2208 { return true }
        return false
    }
    
    /// iPhone X validation
    public var isIphoneX : Bool {
        if !isIphone { return false }
        if nativeSize.height == 2436 { return true }
        return false
    }
}
