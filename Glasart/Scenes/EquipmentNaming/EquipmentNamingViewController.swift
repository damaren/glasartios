//
//  EquipmentNamingViewController.swift
//  Glasart
//
//  Created by Damaren on 21/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class EquipmentNamingViewController: UIViewController {

    fileprivate var presenter : EquipmentNamingModule?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:EquipmentNamingPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
	}
    
    deinit {
        stopObservers()
    }
}

// MARK: - View Delegate
extension EquipmentNamingViewController : EquipmentNamingView {
    public func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - Configurations
extension EquipmentNamingViewController { 
    func startObservers() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func stopObservers() {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nc.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func showKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard show behavior here
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard hide behavior here
        }
    }
}
