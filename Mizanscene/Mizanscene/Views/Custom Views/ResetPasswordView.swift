//
//  ResetPasswordView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/06 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

class ResetPasswordView: UIView {

    @IBOutlet weak var logoImg: UIImageView!

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var verifyPasswordTF: UITextField!

    @IBOutlet weak var resetPasswordBtn: UIButton!

    func setViews() {
        logoImg.image = UIImage(named: "Image")

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIcon(UIImage(named: "Image")!)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        verifyPasswordTF.placeholder = StringHelper.getVerifyPasswordTF()
        verifyPasswordTF.setIcon(UIImage(named: "Image")!)
        verifyPasswordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        resetPasswordBtn.setTitle(StringHelper.getResetPassword(), for: .normal)

    }
}
