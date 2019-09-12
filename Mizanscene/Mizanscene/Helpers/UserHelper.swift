//
//  UserHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/12 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import SwiftyJSON

@objc protocol UserDelegate: NSObjectProtocol {
    @objc optional func validateTokenSuccessfully()
    @objc optional func validateTokenUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func loginSuccessfully(userID: Int, token: String, email: String)
    @objc optional func loginUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func getUserDetailsSuccessfully()
    @objc optional func getUserDetailsUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func sendCodeToResetPasswordSuccessfully(userID: Int)
    @objc optional func sendCodeToResetPasswordUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func sendCodeToRegisterSuccessfully(userID: Int)
    @objc optional func sendCodeToRegisterUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func verifyCodeSuccessfully()
    @objc optional func verifyCodeUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func resetCodeSuccessfully()
    @objc optional func resetCodeUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func resetPasswordSuccessfully()
    @objc optional func resetPasswordUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func registerSuccessfully()
    @objc optional func registerUnsuccessfully(errorCode: String, errorMessage: String)

    @objc optional func changeEmailSuccessfully()
    @objc optional func changeEmailUnsuccessfully(errorCode: String, errorMessage: String)
}

class UserHelper {
    
    var delegate: UserDelegate!

    func validateToken(token: String) { //??: chera poste? age token ok bashe code true mishe?

        APIHelper.shared.sendGetRequest(urlString: ValueKeeper.validateTokenURL) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.validateTokenSuccessfully)) {
                    self.delegate!.validateTokenSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.validateTokenUnsuccessfully)) {
                    self.delegate!.validateTokenUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }

    func login(email: String, password: String) {
        let queries: [String: String] = [
            "email": email,
            "password": password
        ]

        APIHelper.shared.sendPostRequest(urlString: ValueKeeper.loginURL, queries: queries, params: [:]) {
            (status, code, message, data) in
            if status {
                let userID = data["user_id"].intValue
                let token = data["token"].stringValue
                let email = data["email"].stringValue

                if self.delegate.responds (to: #selector(UserDelegate.loginSuccessfully)) {
                    self.delegate!.loginSuccessfully!(userID: userID, token: token, email: email)
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.loginUnsuccessfully)) {
                    self.delegate!.loginUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }

    func sendCodeToResetPassword(email: String) { //??: user_email ya email? :|
        let queries: [String: String] = [
            "email": email,
            "SECRET_MZ_KEY": "SALAM_MZ_SERVER"
        ]

        APIHelper.shared.sendGetRequest(urlString: ValueKeeper.resetPasswordURL, queries: queries) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.sendCodeToResetPasswordSuccessfully)) {
                    self.delegate!.sendCodeToResetPasswordSuccessfully!(userID: data["user_id"].intValue)
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.sendCodeToResetPasswordUnsuccessfully)) {
                    self.delegate!.sendCodeToResetPasswordUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }

    }

    func sendCodeToRegister(email: String) {
        let queries: [String: String] = [
            "SECRET_MZ_KEY": "SALAM_MZ_SERVER"
        ]

        let params: [String: AnyObject] = [
            "email": email as AnyObject
        ]

        APIHelper.shared.sendPostRequest(urlString: ValueKeeper.registerURL, queries: queries, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.sendCodeToRegisterSuccessfully)) {
                    self.delegate!.sendCodeToRegisterSuccessfully!(userID: data["user_id"].intValue)
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.sendCodeToRegisterUnsuccessfully)) {
                    self.delegate!.sendCodeToRegisterUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }

    func verifyCode(userID: Int, action: String, code: String) {

        let queries: [String: String] = [
            "SECRET_MZ_KEY": "SALAM_MZ_SERVER"
        ]

        let params: [String: AnyObject] = [
            "user_id": userID as AnyObject,
            "verification_code": code as AnyObject,
            "action": action as AnyObject
        ]

        APIHelper.shared.sendPostRequest(urlString: ValueKeeper.verifyCodeURL, queries: queries, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.verifyCodeSuccessfully)) {
                    self.delegate!.verifyCodeSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.verifyCodeUnsuccessfully)) {
                    self.delegate!.verifyCodeUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }


    func resetPassword(userID: Int, password: String) {

        let queries: [String: String] = [
            "SECRET_MZ_KEY": "SALAM_MZ_SERVER"
        ]

        let params: [String: AnyObject] = [
            "user_id": userID as AnyObject,
            "password": password as AnyObject
        ]

        APIHelper.shared.sendPostRequest(urlString: ValueKeeper.resetPasswordURL, queries: queries, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.resetPasswordSuccessfully)) {
                    self.delegate!.resetPasswordSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.resetPasswordUnsuccessfully)) {
                    self.delegate!.resetPasswordUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }

    }

    func register(userID: Int, firstName: String, lastName: String, password: String) {

        let queries: [String: String] = [
            "SECRET_MZ_KEY": "SALAM_MZ_SERVER"
        ]

        let params: [String: AnyObject] = [
            "user_id": userID as AnyObject,
            "first_name": firstName as AnyObject,
            "last_name": lastName as AnyObject,
            "password": password as AnyObject
        ]

        APIHelper.shared.sendPutRequest(urlString: ValueKeeper.registerURL, queries: queries, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.registerSuccessfully)) {
                    self.delegate!.registerSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.registerUnsuccessfully)) {
                    self.delegate!.registerUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }

    }

    func changeEmail(userID: Int, email: String) {
        let params: [String: AnyObject] = [
            "user_id": userID as AnyObject,
            "email": email as AnyObject
        ]

        APIHelper.shared.sendPutRequest(urlString: ValueKeeper.registerURL, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.changeEmailSuccessfully)) {
                    self.delegate!.changeEmailSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.changeEmailUnsuccessfully)) {
                    self.delegate!.changeEmailUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }

    }


    func getUserDetails() {
        APIHelper.shared.sendGetRequest(urlString: ValueKeeper.getUserDetailsURL) {
            (status, code, message, data) in
            if status {

                if self.delegate.responds (to: #selector(UserDelegate.getUserDetailsSuccessfully)) {
                    self.delegate!.getUserDetailsSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.getUserDetailsUnsuccessfully)) {
                    self.delegate!.getUserDetailsUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }

    func resetCode(userID: Int) {
        let params: [String: AnyObject] = [
            "user_id": userID as AnyObject
        ]

        APIHelper.shared.sendPostRequest(urlString: ValueKeeper.resetCodeURL, params: params) {
            (status, code, message, data) in
            if status {
                if self.delegate.responds (to: #selector(UserDelegate.resetCodeSuccessfully)) {
                    self.delegate!.resetCodeSuccessfully!()
                }
            } else {
                if self.delegate.responds(to: #selector(UserDelegate.resetCodeUnsuccessfully)) {
                    self.delegate!.resetCodeUnsuccessfully!(errorCode: code.stringValue, errorMessage: message.stringValue)
                }
            }
        }
    }
}
