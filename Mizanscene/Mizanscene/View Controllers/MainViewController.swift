//
//  MainViewController.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit
import paper_onboarding
import NVActivityIndicatorView

enum Action: String {
    case register = "register"
    case resetPassword = "reset"
}

class MainViewController: UIViewController, NVActivityIndicatorViewable {

    let pages = [OnboardingItemInfo(informationImage: UIImage(named: "logo")!,
        title: "title1",
        description: "description1",
        pageIcon: UIImage(named: "logo")!,
        color: .lightGray,
        titleColor: .blue,
        descriptionColor: .red,
        titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
        descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)),
        OnboardingItemInfo(informationImage: UIImage(named: "logo")!,
            title: "title2",
            description: "description2",
            pageIcon: UIImage(named: "logo")!,
            color: .lightGray,
            titleColor: .blue,
            descriptionColor: .red,
            titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
            descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)),
        OnboardingItemInfo(informationImage: UIImage(named: "logo")!,
            title: "title3",
            description: "description3",
            pageIcon: UIImage(named: "logo")!,
            color: .lightGray,
            titleColor: .blue,
            descriptionColor: .red,
            titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
            descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin))
    ]

    let userHelper = UserHelper()

    let onboardingView = PaperOnboarding()
    var loginView = LoginView()
    var resetPasswordView = ResetPasswordView()
    var receiveCodeView = ReceiveCodeView()
    var registerView = RegisterView()
    var enterCodeView = EnterCodeView()
    var indicatorView = NVActivityIndicatorView(frame: .zero)

    var receiveCodeAction: Action = .register
    var userEmail = ""
    var userID = 0

    override func viewDidLoad() {

        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()

        userHelper.delegate = self

        onboardingView.isHidden = true
        loginView.isHidden = true
        resetPasswordView.isHidden = true
        receiveCodeView.isHidden = true
        registerView.isHidden = true
        enterCodeView.isHidden = true

        if UserDefaultsHelper.getBoolean(key: ValueKeeper.hasLaunchedOnce, defaultValue: false) {
            flowDetector()
        } else {
            setupPaperOnboardingView()
            onboardingView.isHidden = false
        }

//        setupEnterCodeView()
    }


    private func startIndicator() {
        let indicatorSize = 50
        let backgroundGray = UIColor(displayP3Red: 0.77, green: 0.77, blue: 0.77, alpha: 0.5)

        startAnimating(CGSize(width: indicatorSize, height: indicatorSize), type: .ballRotateChase, color: ValueKeeper.errorAlertFrameColor, backgroundColor: backgroundGray)
    }

    private func setupPaperOnboardingView() {

        onboardingView.delegate = self
        onboardingView.dataSource = self
        onboardingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingView)

        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboardingView,
                attribute: attribute,
                relatedBy: .equal,
                toItem: view,
                attribute: attribute,
                multiplier: 1,
                constant: 0)
            view.addConstraint(constraint)
        }

        let skipButton = UIButton()
        skipButton.frame = CGRect(x: view.frame.size.width - 70, y: 50, width: 50, height: 50)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        skipButton.isEnabled = true

        view.addSubview(skipButton)

        view.bringSubviewToFront(skipButton)
    }

    @objc func skipButtonAction(sender: UIButton!) {
        onboardingView.isHidden = true
        UserDefaultsHelper.setBool(key: ValueKeeper.hasLaunchedOnce, value: true)
        flowDetector()
    }

    private func flowDetector() {
        let token = UserDefaultsHelper.getString(key: ValueKeeper.userToken, defaultValue: "")
        if token == "" {
            setupLoginView()
            loginView.isHidden = false
        } else {
            //if valid -> movie
        }

    }

    private func setupLoginView() {
        if let fetchedLoginView = Bundle.main.loadNibNamed("Login", owner: self, options: nil)?.first as? LoginView {
            loginView = fetchedLoginView
            loginView.setViews()
            loginView.loginBtn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
            loginView.gotoRegisterBtn.addTarget(self, action: #selector(gotoRegisterButtonAction), for: .touchUpInside)
            loginView.forgetPasswordBtn.addTarget(self, action: #selector(forgetPasswordButtonAction), for: .touchUpInside)
            view.addSubview(loginView)
        }
    }

    private func validateLoginInputs(email: String, password: String) -> Bool {
        if email.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if password.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourPasswordPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false

        }
        if !ValidationHelper.validateEmail(email: email) {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailCorrectlyPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        return true
    }

    @objc func loginButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            let email = loginView.emailTF.text!
            let password = loginView.emailTF.text!
            if validateLoginInputs(email: email, password: password) {
                loginView.loginBtn.isEnabled = false
                loginView.gotoRegisterBtn.isEnabled = false
                loginView.forgetPasswordBtn.isEnabled = false
                userHelper.login(email: email, password: password)
                startIndicator()
            }
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())
        }


    }

    @objc func gotoRegisterButtonAction(sender: UIButton!) {
        loginView.isHidden = true
        receiveCodeAction = .register
        receiveCodeView.action = .register
        setupReceiveCodeView()
        receiveCodeView.isHidden = false
    }

    @objc func forgetPasswordButtonAction(sender: UIButton!) {
        loginView.isHidden = true
        receiveCodeAction = .resetPassword
        receiveCodeView.action = .resetPassword
        setupReceiveCodeView()
        receiveCodeView.isHidden = false
    }

    private func setupReceiveCodeView() {
        if let fetchedReceiveCodeView = Bundle.main.loadNibNamed("ReceiveCode", owner: self, options: nil)?.first as? ReceiveCodeView {
            receiveCodeView = fetchedReceiveCodeView
            receiveCodeView.setViews()
            receiveCodeView.receiveCodeBtn.addTarget(self, action: #selector(receiveCodeButtonAction), for: .touchUpInside)
            receiveCodeView.backBtn.addTarget(self, action: #selector(receiveCodeBackButtonAction), for: .touchUpInside)

            view.addSubview(receiveCodeView)
        }
    }

    private func validateReceiveCodeInput(email: String) -> Bool {
        if email.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if !ValidationHelper.validateEmail(email: email) {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailCorrectlyPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        return true
    }

    @objc func receiveCodeButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            let email = receiveCodeView.emailTF.text!

            if validateReceiveCodeInput(email: email) {
                userEmail = email
                receiveCodeView.receiveCodeBtn.isEnabled = false
                if receiveCodeAction == .register {
                    userHelper.sendCodeToRegister(email: email)
                } else {
                    userHelper.sendCodeToResetPassword(email: email)
                }
                startIndicator()
            }
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())

        }

    }

    @objc func receiveCodeBackButtonAction(sender: UIButton!) {
        setupLoginView()
        loginView.isHidden = false
        receiveCodeView.emailTF.text = ""
        receiveCodeView.isHidden = true
    }

    private func setupEnterCodeView() {
        if let fetchedSetupEnterCodeView = Bundle.main.loadNibNamed("EnterCodeView", owner: self, options: nil)?.first as? EnterCodeView {

            enterCodeView = fetchedSetupEnterCodeView
            enterCodeView.emailLbl.text = userEmail
            enterCodeView.receiveCodeAgainBtn.isHidden = true //no again! :|

            enterCodeView.setViews()

            enterCodeView.editEmailBtn.addTarget(self, action: #selector(editEmailButtonAction), for: .touchUpInside)
            enterCodeView.sendCodeBtn.addTarget(self, action: #selector(sendCodeButtonAction), for: .touchUpInside)
            enterCodeView.receiveCodeAgainBtn.addTarget(self, action: #selector(receiveCodeAgainButtonAction), for: .touchUpInside)

            view.addSubview(enterCodeView)
        }
    }
    @objc func editEmailButtonAction(sender: UIButton!) {
        enterCodeView.isHidden = true
        setupReceiveCodeView()
        receiveCodeView.emailTF.text = userEmail
        receiveCodeView.isHidden = false
    }
    @objc func sendCodeButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            enterCodeView.sendCodeBtn.isEnabled = false
            enterCodeView.editEmailBtn.isEnabled = false
            enterCodeView.receiveCodeAgainBtn.isEnabled = false

            userHelper.verifyCode(userID: self.userID, action: self.receiveCodeAction.rawValue, code: enterCodeView.codeTF.text!)
            startIndicator()
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())
        }
    }
    @objc func receiveCodeAgainButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            enterCodeView.sendCodeBtn.isEnabled = false
            enterCodeView.editEmailBtn.isEnabled = false
            enterCodeView.receiveCodeAgainBtn.isEnabled = false

            userHelper.resetCode(userID: self.userID)

            startIndicator()
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())
        }
    }


    private func setupResetPasswordView() {
        if let fetchedResetPasswordView = Bundle.main.loadNibNamed("ResetPassword", owner: self, options: nil)?.first as? ResetPasswordView {
            resetPasswordView = fetchedResetPasswordView
            resetPasswordView.setViews()
            resetPasswordView.resetPasswordBtn.addTarget(self, action: #selector(resetPasswordButtonAction), for: .touchUpInside)
            view.addSubview(resetPasswordView)
        }
    }

    private func validateResetPasswordInputs(password: String, verifyPassword: String) -> Bool {
        if password.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if verifyPassword.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourVerifyPasswordPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }

        if password.count < 6 {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordLetterCountMoreThan6(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }

        if password != verifyPassword {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordsAreNotMatch(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        return true
    }

    @objc func resetPasswordButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            let password = resetPasswordView.passwordTF.text!
            let verifyPassword = resetPasswordView.verifyPasswordTF.text!
            if validateResetPasswordInputs(password: password, verifyPassword: verifyPassword) {
                resetPasswordView.resetPasswordBtn.isEnabled = false
                userHelper.resetPassword(userID: self.userID, password: resetPasswordView.passwordTF.text!)
                startIndicator()
            }
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())
        }
    }

    private func setupRegisterView() {
        if let fetchedRegisterView = Bundle.main.loadNibNamed("Register", owner: self, options: nil)?.first as? RegisterView {
            registerView = fetchedRegisterView
            registerView.setViews()
            registerView.registerBtn.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
            view.addSubview(registerView)
        }
    }

    private func validateRegisterInputs(firstName: String, lastName: String, password: String, verifyPassword: String) -> Bool {
        if firstName.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourFirstNamePlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if lastName.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourLastNamePlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if password.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if verifyPassword.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourVerifyPasswordPlease(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if password.count < 6 {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordLetterCountMoreThan6(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        if password != verifyPassword {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordsAreNotMatch(), frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
            return false
        }
        return true
    }

    @objc func registerButtonAction(sender: UIButton!) {
        if Connectivity.isConnectedToInternet() {
            let firstName = registerView.firstnameTF.text!
            let lastName = registerView.lastnameTF.text!
            let password = registerView.passwordTF.text!
            let verifyPassword = registerView.verifyPasswordTF.text!

            if validateRegisterInputs(firstName: firstName, lastName: lastName, password: password, verifyPassword: verifyPassword) {
                registerView.registerBtn.isEnabled = false

                userHelper.register(userID: self.userID, firstName: firstName, lastName: lastName, password: password)
                startIndicator()
            }
        } else {
            ViewHelper.showToastMessage(message: StringHelper.getCheckYourConnectivity())
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension MainViewController: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return pages.count
    }

    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return pages[index]
    }

}

extension MainViewController: PaperOnboardingDelegate {

    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {

        // configure item

        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

extension MainViewController: UserDelegate {

    func loginSuccessfully(userID: Int, token: String, email: String) {

        self.userID = userID
        self.userEmail = email
        APIHelper.shared.setToken(token: token)

        loginView.loginBtn.isEnabled = true
        loginView.gotoRegisterBtn.isEnabled = true
        loginView.forgetPasswordBtn.isEnabled = true

        //goto main
        stopAnimating()
    }
    func loginUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)

        loginView.loginBtn.isEnabled = true
        loginView.gotoRegisterBtn.isEnabled = true
        loginView.forgetPasswordBtn.isEnabled = true

        stopAnimating()
    }

    func sendCodeToResetPasswordSuccessfully(userID: Int) {

        self.userID = userID

        receiveCodeView.isHidden = true
        receiveCodeView.receiveCodeBtn.isEnabled = true

        setupEnterCodeView()
        enterCodeView.isHidden = false

        stopAnimating()
    }
    func sendCodeToResetPasswordUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
        receiveCodeView.receiveCodeBtn.isEnabled = true

        stopAnimating()
    }

    func sendCodeToRegisterSuccessfully(userID: Int) {

        receiveCodeView.receiveCodeBtn.isEnabled = true
        receiveCodeView.isHidden = true

        self.userID = userID

        setupEnterCodeView()
        enterCodeView.isHidden = false

        stopAnimating()
    }
    func sendCodeToRegisterUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)
        receiveCodeView.receiveCodeBtn.isEnabled = true

        stopAnimating()
    }

    func verifyCodeSuccessfully() {
        enterCodeView.isHidden = true

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true
        enterCodeView.receiveCodeAgainBtn.isEnabled = true

        if receiveCodeAction == .register {
            setupRegisterView()
            registerView.isHidden = false
        } else {
            setupResetPasswordView()
            resetPasswordView.isHidden = false
        }

        stopAnimating()
    }
    func verifyCodeUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true
        enterCodeView.receiveCodeAgainBtn.isEnabled = true

        stopAnimating()
    }

    func resetCodeSuccessfully() {
        ViewHelper.userActionsToastView(message: StringHelper.getSuccessfulResetCode(), frameColor: ValueKeeper.messageAlertFrameColor, textColor: ValueKeeper.messageAertTextColor)

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true
        enterCodeView.receiveCodeAgainBtn.isEnabled = true

        stopAnimating()
    }
    func resetCodeUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true
        enterCodeView.receiveCodeAgainBtn.isEnabled = true

        stopAnimating()
    }

    func resetPasswordSuccessfully() {

        resetPasswordView.isHidden = true
        resetPasswordView.resetPasswordBtn.isEnabled = true

        ViewHelper.userActionsToastView(message: StringHelper.getSuccessfulResetPassword(), frameColor: ValueKeeper.messageAlertFrameColor, textColor: ValueKeeper.messageAertTextColor)

        setupLoginView()

        loginView.isHidden = false

        stopAnimating()
    }
    func resetPasswordUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)

        resetPasswordView.resetPasswordBtn.isEnabled = true

        stopAnimating()
    }

    func registerSuccessfully() {

        registerView.isHidden = true
        registerView.registerBtn.isEnabled = true

        ViewHelper.userActionsToastView(message: StringHelper.getSuccessfulRegister(), frameColor: ValueKeeper.messageAlertFrameColor, textColor: ValueKeeper.messageAertTextColor)

        setupLoginView()

        loginView.isHidden = false

        stopAnimating()
    }
    func registerUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage, frameColor: ValueKeeper.errorAlertFrameColor, textColor: ValueKeeper.errorAlertTextColor)

        registerView.registerBtn.isEnabled = true

        stopAnimating()
    }

    func changeEmailSuccessfully() {

    }
    func changeEmailUnsuccessfully(errorCode: String, errorMessage: String) {

    }

    func getUserDetailsSuccessfully() {

    }
    func getUserDetailsUnsuccessfully(errorCode: String, errorMessage: String) {

    }

    func validateTokenSuccessfully() {

    }
    func validateTokenUnsuccessfully(errorCode: String, errorMessage: String) {

    }

}
