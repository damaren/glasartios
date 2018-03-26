//
//  LoginViewController.swift
//  Glasart
//
//  Created by Damaren on 23/02/2018.
//  Copyright © 2018 FluidObjects. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {

    fileprivate var presenter : LoginModule?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var verticalViewConstraint: NSLayoutConstraint!
    
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
    
    public func inject(presenter:LoginPresenter?) {
        self.presenter = presenter
    }
    
    fileprivate func assertDependencies() {
        assert(presenter != nil, "Did not set Presenter to the view")
    }

	fileprivate func setup() {
        startObservers()
        emailTextField.simplePlaceholderStyle()
        passwordTextField.simplePlaceholderStyle()
        enterButton.layer.cornerRadius = 3.0
        enterButton.layer.masksToBounds = true
        self.navigationController?.isNavigationBarHidden = true
	}
    
    deinit {
        stopObservers()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        becomeFirstResponder()
    }
    
    @IBAction func confirmLogin(_ sender: Any) {
        presenter?.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        presenter?.forgotPassword()
    }

    @IBAction func register(_ sender: Any) {
        presenter?.register()
    }
    
}

// MARK: - View Delegate
extension LoginViewController : LoginView {
    public func show(something: String) {
        //Implement what to show here
    }
}

// MARK: - Configurations
extension LoginViewController { 
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
            let offset:CGFloat = 50.0
            let frameHeight = finalFrame.height - offset
            
            // Implement keyboard show behavior here
            verticalViewConstraint.constant = -frameHeight
            view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func hideKeyboard(notification:Notification) {
        if let frame = notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue {
            let finalFrame = frame.cgRectValue
            let frameHeight = finalFrame.height
            
            // Implement keyboard hide behavior here
            verticalViewConstraint.constant = 0.0
            view.setNeedsUpdateConstraints()
            
            UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.view.layoutIfNeeded()
            })
        }
    }
}
