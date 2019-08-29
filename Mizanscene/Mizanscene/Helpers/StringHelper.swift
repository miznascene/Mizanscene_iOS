//
//  StringHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation

class StringHelper {

    class func getUsername() -> String {
        if ValueKeeper.language == "fa" {
            return "نام کاربری"
        } else {
            return "Username"
        }
    }

    class func getPassword() -> String {
        if ValueKeeper.language == "fa" {
            return "رمز عبور"
        } else {
            return "Password"
        }
    }

    class func getLogin() -> String {
        if ValueKeeper.language == "fa" {
            return "ورود"
        } else {
            return "Login"
        }
    }

    class func getForgetPassword() -> String {
        if ValueKeeper.language == "fa" {
            return "فراموشی رمز عبور"
        } else {
            return "Forget password"
        }
    }

    class func getRegister() -> String{
        if ValueKeeper.language == "fa" {
            return "ثبت نام"
        } else {
            return "Register"
        }
    }

    class func getEmail() -> String{
        if ValueKeeper.language == "fa" {
            return "ایمیل"
        } else {
            return "Email"
        }
    }

    class func getVerifyPasswordTF() -> String{
        if ValueKeeper.language == "fa" {
            return "تایید رمز عبور"
        } else {
            return "Verify password"
        }
    }

    class func getResetPassword() -> String{
        if ValueKeeper.language == "fa" {
            return "بازیابی رمز عبور"
        } else {
            return "Reset password"
        }
    }

    class func getReceiveCode() -> String{
        if ValueKeeper.language == "fa" {
            return "دریافت کد"
        } else {
            return "Receive code"
        }
    }

    class func getFirstname() -> String{
        if ValueKeeper.language == "fa" {
            return "نام"
        } else {
            return "Firstname"
        }
    }

    class func getLastname() -> String{
        if ValueKeeper.language == "fa" {
            return "نام خانوادگی"
        } else {
            return "Lastname"
        }
    }

    class func get4DigitCode() -> String {
        if ValueKeeper.language == "fa" {
            return "کد ۴ رقمی"
        } else {
            return "4 digits code"
        }
    }

    class func getEnterYourCode() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفاً کد ۴رقمی خود را وارد نمایید."
        } else {
            return "Please enter your 4 digits code here."
        }
    }

}
