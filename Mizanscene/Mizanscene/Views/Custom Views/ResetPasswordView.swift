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
        let y: Double = Double(resetPasswordLbl.frame.origin.y - 15)
        let x: Double = 50
        let pinkView = ViewHelper.makePinkBackView(x: x, y: y)
        self.addSubview(pinkView)
        self.sendSubviewToBack(pinkView)

        logoImg.image = UIImage(named: "logo")

        resetPasswordLbl.text = StringHelper.getEnterYourNewPassword()
        if ValueKeeper.language == "fa" {
            resetPasswordLbl.textAlignment = .right
        } else {
            resetPasswordLbl.textAlignment = .left
        }
        resetPasswordLbl.font = FontHelper.getIRANSansMobile(size: 11)
        resetPasswordLbl.textColor = ValueKeeper.textsPrimaryColor

        passwordTF.placeholder = StringHelper.getPassword()
        passwordTF.setIconWithSeparatorLine(UIImage(named: "textfieldKeyIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        passwordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        passwordTF.font = FontHelper.getIRANSansMobile(size: 7)
        passwordTF.textColor = ValueKeeper.textsPrimaryColor
        passwordTF.layer.cornerRadius = 5
        passwordTF.layer.masksToBounds = true

        verifyPasswordTF.placeholder = StringHelper.getVerifyPasswordTF()
        verifyPasswordTF.setIconWithSeparatorLine(UIImage(named: "textfieldKeyIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        verifyPasswordTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        verifyPasswordTF.font = FontHelper.getIRANSansMobile(size: 7)
        verifyPasswordTF.textColor = ValueKeeper.textsPrimaryColor
        verifyPasswordTF.layer.cornerRadius = 5
        verifyPasswordTF.layer.masksToBounds = true

        resetPasswordBtn.setTitle(StringHelper.getResetPassword(), for: .normal)
        resetPasswordBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        resetPasswordBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 8)
        resetPasswordBtn.backgroundColor = .white
        resetPasswordBtn.layer.cornerRadius = 5
        resetPasswordBtn.makeBottomShadow(height: 4, color: .black, opacity: 0.25)
    }
}
