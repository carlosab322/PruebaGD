//
//  Helper.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/25/20.
//

import Foundation
import UIKit
import SVProgressHUD
protocol MessageHelper {

}

extension MessageHelper {
func showWait(_ msj: String? ) {
    SVProgressHUD.setForegroundColor(Constants.colorPrimario)
    SVProgressHUD.show(withStatus: msj)
}
    func  dismissMsg() {
        SVProgressHUD.dismiss()
    }
func showError(_ msj: String? ) {
    if self is UIViewController || self is UINavigationController {
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error",
                                          message: "\n\(msj ?? ""))", preferredStyle: .alert)
            alert.setTitle()
            alert.setMessage()
            alert.setTint()
            let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(button)
            let controller = self as? UIViewController
            DispatchQueue.main.async {
                controller?.present(alert, animated: false, completion: nil)
            }
        } else {
            SVProgressHUD.showError(withStatus: msj)
        }

    }
}
import UIKit
extension UIAlertController {
    // Set background color of UIAlertController
    func setBackgroundColor(color: UIColor = Constants.colorFondo) {
        if let bgView = self.view.subviews.first,
            let groupView = bgView.subviews.first,
            let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }
    // Set title font and title color
    func setTitle(font: UIFont? = nil, color: UIColor? = nil) {
        guard let title = self.title else { return }
        let attributeString = NSAttributedString(string: title,
        attributes: [
        NSAttributedString.Key.foregroundColor: color ?? Constants.colorPrimario]
        )
        self.setValue(attributeString, forKey: "attributedTitle")
            }
    // Set message font and message color
    func setMessage(font: UIFont? = nil, color: UIColor? = nil, alignment: NSTextAlignment = .center) {
        guard let message = self.message else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        let attributeString = NSAttributedString(string: message,
                                              attributes: [
        NSAttributedString.Key.foregroundColor: color ?? Constants.colorPrimario,
        NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        self.setValue(attributeString, forKey: "attributedMessage")
    }
    //Set tint color of UIAlertController
    func setTint(color: UIColor = Constants.colorPrimario) {
        self.view.tintColor = color
    }
}
extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        guard let labelText = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString: NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString =
                NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        // (Swift 4.2 and above) Line spacing attribute
        // swiftlint:disable legacy_constructor
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}

extension UITableView {
    func setEmptyView(title: String, message: String, ishidden:Bool) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyView.isHidden = ishidden
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo:
                                                emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo:
                                                emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo:
                                            titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
        }
        func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
}
}

