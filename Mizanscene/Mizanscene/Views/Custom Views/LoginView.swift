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
        let y: Double = Double(loginLbl.frame.origin.y - 15)
        let x: Double = 50
        let pinkView = ViewHelper.makePinkBackView(x: x, y: y)
        self.addSubview(pinkView)
        self.sendSubviewToBack(pinkView)

        logoImg.image = UIImage(named: "logo")

        loginLbl.text = StringHelper.getLogin()
        if ValueKeeper.language == "fa" {
            loginLbl.textAlignment = .right
        } else {
            loginLbl.textAlignment = .left
        }
        loginLbl.font = FontHelper.getIRANSansMobile(size: 11)
        loginLbl.textColor = ValueKeeper.textsPrimaryColor


        emailTF.placeholder = StringHelper.getEmail()
        emailTF.setIconWithSeparatorLine(UIImage(named: "textfieldMailIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        emailTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        emailTF.font = FontHelper.getIRANSansMobile(size: 7)
        emailTF.textColor = ValueKeeper.textsPrimaryColor
        emailTF.layer.cornerRadius = 5
        emailTF.layer.masksToBounds = true

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIconWithSeparatorLine(UIImage(named: "textfieldKeyIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        passwordTF.font = FontHelper.getIRANSansMobile(size: 7)
        passwordTF.textColor = ValueKeeper.textsPrimaryColor
        passwordTF.layer.cornerRadius = 5
        passwordTF.layer.masksToBounds = true

        loginBtn.setTitle(StringHelper.getLogin(), for: .normal)
        loginBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        loginBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 11)
        loginBtn.backgroundColor = .white
        loginBtn.layer.cornerRadius = 5
        loginBtn.makeBottomShadow(height: 4, color: .black, opacity: 0.25)

        forgetPasswordBtn.setTitle(StringHelper.getForgetPassword(), for: .normal)
        forgetPasswordBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        if ValueKeeper.language == "fa" {
            forgetPasswordBtn.contentHorizontalAlignment = .left
        } else {
            forgetPasswordBtn.contentHorizontalAlignment = .right
        }
        forgetPasswordBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 6)

        gotoRegisterBtn.setTitle(StringHelper.getNoAccountRegister(), for: .normal)
        gotoRegisterBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        gotoRegisterBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 8)
    }

}
