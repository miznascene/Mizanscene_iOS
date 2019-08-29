//
//  RegisterView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/06 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

class RegisterView: UIView {

    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var verifyPasswordTF: UITextField!

    @IBOutlet weak var registerBtn: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func setViews() {

        firstnameTF.placeholder = StringHelper.getFirstname()
        firstnameTF.setIcon(UIImage(named: "Image")!)
        firstnameTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        lastnameTF.placeholder = StringHelper.getLastname()
        lastnameTF.setIcon(UIImage(named: "Image")!)
        lastnameTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIcon(UIImage(named: "Image")!)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        verifyPasswordTF.placeholder = StringHelper.getVerifyPasswordTF()
        verifyPasswordTF.setIcon(UIImage(named: "Image")!)
        verifyPasswordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        registerBtn.setTitle(StringHelper.getRegister(), for: .normal)
    }
}
