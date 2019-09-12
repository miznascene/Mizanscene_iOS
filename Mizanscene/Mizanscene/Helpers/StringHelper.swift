//
//  StringHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation

class StringHelper {

    class func getLogin() -> String {
        if ValueKeeper.language == "fa" {
            return "ورود"
        } else {
            return "Login"
        }
    }

    class func getEnterYourEmailToRegister() -> String {
        if ValueKeeper.language == "fa" {
            return "برای ثبت نام ایمیل خود را وارد کنید."
        } else {
            return "Please enter your email to register"
        }
    }

    class func getEnterYourEmailToResetPassword() -> String {
        if ValueKeeper.language == "fa" {
            return "برای بازیابی رمز عبور ایمیل خود را وارد کنید."
        } else {
            return "Please enter your email to reset password"
        }
    }

    class func getCompleteTheFormToRegister() -> String {
        if ValueKeeper.language == "fa" {
            return "برای ثبت نام فرم زیر را تکمیل نمایید."
        } else {
            return "Please complete this form to register."
        }
    }

    class func getEnterYourNewPassword() -> String {
        if ValueKeeper.language == "fa" {
            return "رمز عبور جدید را وارد نمایید."
        } else {
            return "Please enter your new password."
        }
    }

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

    class func getForgetPassword() -> String {
        if ValueKeeper.language == "fa" {
            return "رمز عبور خود را فراموش کرده‌اید؟"
        } else {
            return "Forgot your password?"
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

    class func getSendCode() -> String {
        if ValueKeeper.language == "fa" {
            return "ارسال کد"
        } else {
            return "Send code"
        }
    }

    class func getReceiveCodeAgain() -> String {
        if ValueKeeper.language == "fa" {
            return "دریافت دوباره کد"
        } else {
            return "Receive code again"
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

    class func getEnterYourCodePlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفاً کد ۴رقمی خود را وارد نمایید."
        } else {
            return "Please enter your 4 digits code here."
        }
    }

    class func getEnterYourEmailPlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا ایمیل خود را وارد نمایید."
        } else {
            return "Please enter your email."
        }
    }

    class func getEnterYourEmailCorrectlyPlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا ایمیل خود را به صورت صحیح وارد نمایید."
        } else {
            return "Please enter your email correctly."
        }
    }

    class func getEnterYourPasswordPlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا رمز عبور خود را وارد نمایید."
        } else {
            return "Please enter your password."
        }
    }

    class func getEnterYourVerifyPasswordPlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا تکرار رمز عبور خود را وارد نمایید."
        } else {
            return "Please enter your repeated password."
        }
    }

    class func getPasswordLetterCountMoreThan6() -> String {
        if ValueKeeper.language == "fa" {
            return "حداقل رمز عبور ۶ حرف می‌باشد."
        } else {
            return "Password should be more than 6 digits."
        }
    }

    class func getPasswordsAreNotMatch() -> String {
        if ValueKeeper.language == "fa" {
            return "رمز عبورهای وارد شده یکسان نیستند."
        } else {
            return "Passwords are not match."
        }
    }

    class func getEmailEdit() -> String {
        if ValueKeeper.language == "fa" {
            return "تغییر ایمیل"
        } else {
            return "Edit email"
        }
    }

    class func getEnterYourFirstNamePlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا نام خود را وارد نمایید."
        } else {
            return "Please enter your first name."
        }
    }
    class func getEnterYourLastNamePlease() -> String {
        if ValueKeeper.language == "fa" {
            return "لطفا نام خانوادگی خود را وارد نمایید."
        } else {
            return "Please enter your last name."
        }
    }
}
