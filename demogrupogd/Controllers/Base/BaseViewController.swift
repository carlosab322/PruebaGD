//
//  BaseViewController.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import UIKit

class BaseViewController: UIViewController {
@IBOutlet var tableBottom: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    func  updateElementConstraints() {
        //metodo encargado de actualizar la constraints
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            let userInfo = notification.userInfo!
            // swiftlint:disable force_cast
            var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            if let cbottom = tableBottom {
                var safeAreaBottomInset: CGFloat = 0
                if #available(iOS 11.0, *) {
                    safeAreaBottomInset = self.view.safeAreaInsets.bottom
                }
                cbottom.constant = -(keyboardFrame.height - safeAreaBottomInset)
                UIView.animate(withDuration: 1,
                               delay: 0.0,
                               usingSpringWithDamping: 1.0,
                               initialSpringVelocity: 0.5,
                               options: .curveLinear,
                               animations: { () -> Void in
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            updateElementConstraints()
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil,
            let cbottom = tableBottom {
             cbottom.constant = 0

            UIView.animate(withDuration: 1,
                           delay: 0.0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 0.5,
                           options: .curveLinear,
                           animations: { () -> Void in
                self.view.layoutIfNeeded()
            }, completion: nil)

            }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}
