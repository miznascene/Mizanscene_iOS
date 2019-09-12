//
//  LoginView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak var logoImg: UIImageView!

    @IBOutlet weak var loginLbl: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var gotoRegisterBtn: UIButton!

    func setViews() {
        logoImg.image = UIImage(named: "logo")

        loginLbl.text = StringHelper.getLogin()
        if ValueKeeper.language == "fa" {
            loginLbl.textAlignment = .right
        } else {
            loginLbl.textAlignment = .left
        }

        emailTF.placeholder = StringHelper.getEmail()
        emailTF.setIcon(UIImage(named: "logo")!)
        emailTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIcon(UIImage(named: "logo")!)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        loginBtn.setTitle(StringHelper.getLogin(), for: .normal)
        forgetPasswordBtn.setTitle(StringHelper.getForgetPassword(), for: .normal)
        if ValueKeeper.language == "fa" {
            forgetPasswordBtn.contentHorizontalAlignment = .left
        } else {
            forgetPasswordBtn.contentHorizontalAlignment = .right
        }
        gotoRegisterBtn.setTitle(StringHelper.getRegister(), for: .normal)
    }

}
