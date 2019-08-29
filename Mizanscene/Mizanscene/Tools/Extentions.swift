//
//  Extentions.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {

        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.image = image

        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
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
