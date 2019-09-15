//
//  RegisterView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/06 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

class RegisterView: UIView {

    @IBOutlet weak var logoImg: UIImageView!

    @IBOutlet weak var registerLbl: UILabel!

    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var verifyPasswordTF: UITextField!

    @IBOutlet weak var registerBtn: UIButton!
    //dide nemishe



    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func setViews() {
        let y: Double = Double(registerLbl.frame.origin.y - 15)
        let x: Double = 50
        let pinkView = ViewHelper.makePinkBackView(x: x, y: y)
        self.addSubview(pinkView)
        self.sendSubviewToBack(pinkView)

        logoImg.image = UIImage(named: "logo")

        registerLbl.text = StringHelper.getCompleteTheFormToRegister()
        if ValueKeeper.language == "fa" {
            registerLbl.textAlignment = .right
        } else {
            registerLbl.textAlignment = .left
        }
        registerLbl.font = FontHelper.getIRANSansMobile(size: 11)
        registerLbl.textColor = ValueKeeper.textsPrimaryColor

        firstnameTF.placeholder = StringHelper.getFirstname()
        firstnameTF.setIconWithSeparatorLine(UIImage(named: "textfieldUserIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        firstnameTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        firstnameTF.font = FontHelper.getIRANSansMobile(size: 7)
        firstnameTF.textColor = ValueKeeper.textsPrimaryColor
        firstnameTF.layer.cornerRadius = 5
        firstnameTF.layer.masksToBounds = true

        lastnameTF.placeholder = StringHelper.getLastname()
        lastnameTF.setIconWithSeparatorLine(UIImage(named: "textfieldUserIcn")!, separatorColor: ValueKeeper.primaryPinkColor)
        lastnameTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left
        lastnameTF.font = FontHelper.getIRANSansMobile(size: 7)
        lastnameTF.textColor = ValueKeeper.textsPrimaryColor
        lastnameTF.layer.cornerRadius = 5
        lastnameTF.layer.masksToBounds = true

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

        registerBtn.setTitle(StringHelper.getRegister(), for: .normal)
        registerBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        registerBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 11)
        registerBtn.backgroundColor = .white
        registerBtn.layer.cornerRadius = 5
        registerBtn.makeBottomShadow(height: 4, color: .black, opacity: 0.25)
    }
}
