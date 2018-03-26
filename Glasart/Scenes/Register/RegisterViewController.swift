//
//  RegisterViewController.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class RegisterViewController: UIViewController {

    fileprivate var presenter : RegisterModule?
    @IBOutlet weak var confirmCreationButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var razaoSocialTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var verticalViewConstraint: NSLayoutConstraint!
    var frameOffset: CGFloat = 0
    
    public override var canBecomeFirstResponder: Bool {
        return true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
    	setup()
	}

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func inject(presenter:RegisterPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
        nameTextField.simplePlaceholderStyle()
        emailTextField.simplePlaceholderStyle()
        phoneTextField.simplePlaceholderStyle()
        razaoSocialTextField.simplePlaceholderStyle()
        cnpjTextField.simplePlaceholderStyle()
        passwordTextField.simplePlaceholderStyle()
        confirmCreationButton.layer.cornerRadius = 3.0
        confirmCreationButton.layer.masksToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        razaoSocialTextField.delegate = self
        cnpjTextField.delegate = self
        passwordTextField.delegate = self
	}
    
    deinit {
        stopObservers()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        becomeFirstResponder()
    }
    
    @IBAction func alreadyRegistered(_ sender: Any) {
        presenter?.alreadyRegistered()
    }
    
}

// MARK: - View Delegate
extension RegisterViewController : RegisterView {
    public func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - Text Field Delegate
extension RegisterViewController : UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        let fields = [nameTextField, emailTextField, phoneTextField]
        verticalViewConstraint.constant = frameOffset
        
        if DeviceScreen().isIphoneSE {
            for field in fields where field == textField {
                verticalViewConstraint.constant = 60
            }
        }
        view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.2, animations: { [unowned self] in
            self.view.layoutIfNeeded()
        })
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

// MARK: - Configurations
extension RegisterViewController { 
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
            let offset:CGFloat = 60
            let frameHeight = finalFrame.height - offset
            frameOffset = frameHeight
            
            // Implement keyboard show behavior here
//            verticalViewConstraint.constant = frameHeight
//            view.setNeedsUpdateConstraints()
//
//            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
//                self.view.layoutIfNeeded()
//            })
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        dump(notification)
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let offset:CGFloat = 60
            //let frameHeight = finalFrame.height - offset
            
            // Implement keyboard hide behavior here
            verticalViewConstraint.constant = offset
            view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.view.layoutIfNeeded()
            })
        }
    }
}
