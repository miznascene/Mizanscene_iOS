//
//  ReceiveCodeView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/06 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit


class ReceiveCodeView: UIView {

    @IBOutlet weak var logoImg: UIImageView!

    @IBOutlet weak var receiveCodeLbl: UILabel!

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var receiveCodeBtn: UIButton!

    var action: Action = .register
    func setViews() {
        logoImg.image = UIImage(named: "logo")

        if action == .register {
            receiveCodeLbl.text = StringHelper.getEnterYourEmailToRegister()
        } else {
            receiveCodeLbl.text = StringHelper.getEnterYourEmailToResetPassword()
        }

        if ValueKeeper.language == "fa" {
            receiveCodeLbl.textAlignment = .right
        } else {
            receiveCodeLbl.textAlignment = .left
        }

        emailTF.placeholder = StringHelper.getEmail()
        emailTF.setIcon(UIImage(named: "logo")!)
        emailTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        receiveCodeBtn.setTitle(StringHelper.getReceiveCode(), for: .normal)
    }
}
