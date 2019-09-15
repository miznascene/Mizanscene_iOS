//
//  Extentions.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

extension UITextField {
    func setIconWithSeparatorLine(_ image: UIImage, separatorColor: UIColor) {

        let height = self.layer.frame.size.height

        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: height + 5, height: height))

        let lineView = UIView()
        lineView.layer.borderColor = separatorColor.cgColor
        lineView.layer.borderWidth = 1.0
        if ValueKeeper.language == "fa" {
            lineView.frame = CGRect(x: 5, y: 0, width: 1.0, height: height)
        } else {
            lineView.frame = CGRect(x: height - 6, y: 0, width: 1.0, height: height)
        }
        iconContainerView.addSubview(lineView)

        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: height - 10, height: height - 10))
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        iconContainerView.addSubview(iconView)

        if ValueKeeper.language == "fa" {
            rightView = iconContainerView
            rightViewMode = .always
        } else {
            leftView = iconContainerView
            leftViewMode = .always
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIButton {

    func makeBottomShadow(height: CGFloat, color: UIColor, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: height)
        layer.shadowOpacity = opacity
    }
}
