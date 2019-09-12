//
//  ValidationHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation

class ValidationHelper {

    class func validateTextOnly(name: String) -> Bool {
        let nameRegEx = "[A-Za-z ]"

        let name = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return name.evaluate(with: name)
    }

    class func validateCellPhone(phone: String) -> Bool {
        let phoneRegEx = "[0][0-9]{10}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        if phoneTest.evaluate(with: phone) {
            return true
        }
        return false
    }

    class func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    

}
