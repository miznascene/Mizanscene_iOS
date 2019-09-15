//
//  EnterCodeView.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/15 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit
import PinCodeTextField

class EnterCodeView: UIView {

    @IBOutlet weak var logoImg: UIImageView!

    @IBOutlet weak var enterCodeLbl: UILabel!

    @IBOutlet weak var codeTF: PinCodeTextField!

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var editEmailBtn: UIButton!

    @IBOutlet weak var sendCodeBtn: UIButton!
    @IBOutlet weak var receiveCodeAgainBtn: UIButton!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func setViews() {
        let y: Double = Double(enterCodeLbl.frame.origin.y - 15)
        let x: Double = 50
        let pinkView = ViewHelper.makePinkBackView(x: x, y: y)
        self.addSubview(pinkView)
        self.sendSubviewToBack(pinkView)

        logoImg.image = UIImage(named: "logo")

        enterCodeLbl.text = StringHelper.getEnterYourCodePlease()
        if ValueKeeper.language == "fa" {
            enterCodeLbl.textAlignment = .right
        } else {
            enterCodeLbl.textAlignment = .left
        }
        enterCodeLbl.font = FontHelper.getIRANSansMobile(size: 11)
        enterCodeLbl.textColor = ValueKeeper.textsPrimaryColor

        emailLbl.text = "negar@jj.com"
        emailLbl.font = FontHelper.getIRANSansMobile(size: 7)
        emailLbl.textColor = ValueKeeper.textsPrimaryColor

        editEmailBtn.setTitle(StringHelper.getEmailEdit(), for: .normal)
        editEmailBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        editEmailBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 7)

        sendCodeBtn.setTitle(StringHelper.getSendCode(), for: .normal)
        sendCodeBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        sendCodeBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 7)
        sendCodeBtn.backgroundColor = .white
        sendCodeBtn.layer.cornerRadius = 5
        sendCodeBtn.makeBottomShadow(height: 4, color: .black, opacity: 0.25)

        receiveCodeAgainBtn.setTitle(StringHelper.getReceiveCodeAgain(), for: .normal)
        receiveCodeAgainBtn.setTitleColor(ValueKeeper.textsPrimaryColor, for: .normal)
        receiveCodeAgainBtn.titleLabel!.font = FontHelper.getIRANSansMobile(size: 11)
    }

}
