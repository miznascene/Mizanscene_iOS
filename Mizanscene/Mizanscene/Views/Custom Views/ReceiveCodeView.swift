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
    @IBOutlet weak var backBtn: UIButton!

    var action: Action = .register
    func setViews() {
        let y: Double = Double(receiveCodeLbl.frame.origin.y - 15)
        let x: Double = 50
        let pinkView = ViewHelper.makePinkBackView(x: x, y: y)
        self.addSubview(pinkView)
        self.sendSubviewToBack(pinkView)

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
        receiveCodeLbl.font = FontHelper.getIRANSansMobile(size: 11)
        receiveCodeLbl.textColor = ValueKeeper.textsPrimaryColor

        emailTF.placeholder = StringHelper.getEmail()
        emailTF.setIconWithSeparatorLine(UIImage(named: "textfieldMailIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        emailTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        emailTF.font = FontHelper.getIRANSansMobile(size: 7)
        emailTF.textColor = ValueKeeper.textsPrimaryColor
        emailTF.layer.cornerRadius = 5
        emailTF.layer.masksToBounds = true

        receiveCodeBtn.setTitle(StringHelper.getReceiveCode(), for: .normal)
        receiveCodeBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        receiveCodeBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 11)
        receiveCodeBtn.backgroundColor = .white
        receiveCodeBtn.layer.cornerRadius = 5
        receiveCodeBtn.makeBottomShadow(height: 4, color: .black, opacity: 0.25)
    }
}
