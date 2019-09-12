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

    func setViews(){
        logoImg.image = UIImage(named: "logo")

        enterCodeLbl.text = StringHelper.getEnterYourCodePlease()
        if ValueKeeper.language == "fa" {
            enterCodeLbl.textAlignment = .right
        } else {
            enterCodeLbl.textAlignment = .left
        }

        editEmailBtn.setTitle(StringHelper.getEmailEdit(), for: .normal)
        sendCodeBtn.setTitle(StringHelper.getSendCode(), for: .normal)
        receiveCodeAgainBtn.setTitle(StringHelper.getReceiveCodeAgain(), for: .normal)
    }

}
