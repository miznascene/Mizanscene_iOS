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
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var receiveCodeBtn: UIButton!

    func setViews() {
        logoImg.image = UIImage(named: "Image")

        emailTF.placeholder = StringHelper.getEmail()
        emailTF.setIcon(UIImage(named: "Image")!)
        emailTF.textAlignment = (ValueKeeper.language == "fa") ? .right : .left

        receiveCodeBtn.setTitle(StringHelper.getReceiveCode(), for: .normal)
    }
}
