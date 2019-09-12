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

    @IBOutlet weak var resetPasswordLbl: UILabel!

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var verifyPasswordTF: UITextField!

    @IBOutlet weak var resetPasswordBtn: UIButton!

    func setViews() {
        logoImg.image = UIImage(named: "logo")

        resetPasswordLbl.text = StringHelper.getEnterYourNewPassword()
        if ValueKeeper.language == "fa" {
            resetPasswordLbl.textAlignment = .right
        } else {
            resetPasswordLbl.textAlignment = .left
        }

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIcon(UIImage(named: "logo")!)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        verifyPasswordTF.placeholder = StringHelper.getVerifyPasswordTF()
        verifyPasswordTF.setIcon(UIImage(named: "logo")!)
        verifyPasswordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        resetPasswordBtn.setTitle(StringHelper.getResetPassword(), for: .normal)

    }
}
