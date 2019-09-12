//
//  MainViewController.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit
import paper_onboarding

enum Action : String{
    case register = "register"
    case resetPassword = "reset"
}

class MainViewController: UIViewController {

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

    var receiveCodeAction: Action = .register
    var userEmail = ""
    var userID = 0

    override func viewDidLoad() {
        super.viewDidLoad()

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

        // Do any additional setup after loading the view.
//        setupPaperOnboardingView()
//        setupLoginView()
//        setupResetPasswordView()
//        setupReceiveCodeView()
//        setupRegisterView()

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
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease())
            return false
        }
        if password.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourPasswordPlease())
            return false

        }
        if !ValidationHelper.validateEmail(email: email) {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailCorrectlyPlease())
            return false
        }
        return true
    }

    @objc func loginButtonAction(sender: UIButton!) {
        let email = loginView.emailTF.text!
        let password = loginView.emailTF.text!
        if validateLoginInputs(email: email, password: password) {
            loginView.loginBtn.isEnabled = false
            loginView.gotoRegisterBtn.isEnabled = false
            loginView.forgetPasswordBtn.isEnabled = false
            userHelper.login(email: email, password: password)
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
            view.addSubview(receiveCodeView)
        }
    }

    private func validateReceiveCodeInput(email: String) -> Bool{
        if email.count == 0{
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease())
            return false
        }
        if !ValidationHelper.validateEmail(email: email){
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailCorrectlyPlease())
            return false
        }
        return true
    }

    @objc func receiveCodeButtonAction(sender: UIButton!) {
        let email = receiveCodeView.emailTF.text!

        if validateReceiveCodeInput(email: email){
            userEmail = email
            receiveCodeView.receiveCodeBtn.isEnabled = false

            if receiveCodeAction == .register{
                userHelper.sendCodeToRegister(email: email)
            }else{
                userHelper.sendCodeToResetPassword(email: email)
            }
        }
    }

    private func setupEnterCodeView(){
        if let fetchedSetupEnterCodeView = Bundle.main.loadNibNamed("EnterCodeView", owner: self, options: nil)?.first as? EnterCodeView {

            enterCodeView = fetchedSetupEnterCodeView
            enterCodeView.emailLbl.text = userEmail
            enterCodeView.receiveCodeAgainBtn.isHidden = true //no again! :|

            enterCodeView.setViews()

            enterCodeView.editEmailBtn.addTarget(self, action: #selector(editEmailButtonAction), for: .touchUpInside)
            enterCodeView.sendCodeBtn.addTarget(self, action: #selector(sendCodeButtonAction), for: .touchUpInside)
//            enterCodeView.receiveCodeAgainBtn.addTarget(self, action: #selector(receiveCodeAgainButtonAction), for: .touchUpInside)

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
        enterCodeView.sendCodeBtn.isEnabled = false
        enterCodeView.editEmailBtn.isEnabled = false

        userHelper.verifyCode(userID: self.userID, action: self.receiveCodeAction.rawValue, code: enterCodeView.codeTF.text!)
    }
//    @objc func receiveCodeAgainButtonAction(sender: UIButton!) {
//
//    }


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
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease())
            return false
        }
        if verifyPassword.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourVerifyPasswordPlease())
            return false
        }

        if password.count < 6 {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordLetterCountMoreThan6())
            return false
        }

        if password != verifyPassword {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordsAreNotMatch())
            return false
        }
        return true
    }

    @objc func resetPasswordButtonAction(sender: UIButton!) {
        let password = resetPasswordView.passwordTF.text!
        let verifyPassword = resetPasswordView.verifyPasswordTF.text!
        if validateResetPasswordInputs(password: password, verifyPassword: verifyPassword){
            resetPasswordView.resetPasswordBtn.isEnabled = false
            userHelper.resetPassword(userID: self.userID, password: resetPasswordView.passwordTF.text!)
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

    private func validateRegisterInputs(firstName: String, lastName: String, password: String, verifyPassword: String) -> Bool{
        if firstName.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourFirstNamePlease())
            return false
        }
        if lastName.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourLastNamePlease())
            return false
        }
        if password.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourEmailPlease())
            return false
        }
        if verifyPassword.count == 0 {
            ViewHelper.userActionsToastView(message: StringHelper.getEnterYourVerifyPasswordPlease())
            return false
        }
        if password.count < 6 {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordLetterCountMoreThan6())
            return false
        }
        if password != verifyPassword {
            ViewHelper.userActionsToastView(message: StringHelper.getPasswordsAreNotMatch())
            return false
        }
        return true
    }

    @objc func registerButtonAction(sender: UIButton!) {

        let firstName = registerView.firstnameTF.text!
        let lastName = registerView.lastnameTF.text!
        let password = registerView.passwordTF.text!
        let verifyPassword = registerView.verifyPasswordTF.text!

        if validateRegisterInputs(firstName: firstName, lastName: lastName, password: password, verifyPassword: verifyPassword){
            registerView.registerBtn.isEnabled = false

            userHelper.register(userID: self.userID, firstName: firstName, lastName: lastName, password: password)

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
    }
    func loginUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage)

        loginView.loginBtn.isEnabled = true
        loginView.gotoRegisterBtn.isEnabled = true
        loginView.forgetPasswordBtn.isEnabled = true
    }

    func sendCodeToResetPasswordSuccessfully(userID: Int) {

        self.userID = userID

        receiveCodeView.isHidden = true
        receiveCodeView.receiveCodeBtn.isEnabled = true

        setupEnterCodeView()
        enterCodeView.isHidden = false
    }
    func sendCodeToResetPasswordUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage)
        receiveCodeView.receiveCodeBtn.isEnabled = true
    }

    func sendCodeToRegisterSuccessfully(userID: Int) {

        receiveCodeView.receiveCodeBtn.isEnabled = true
        receiveCodeView.isHidden = true

        self.userID = userID

        setupEnterCodeView()
        enterCodeView.isHidden = false
    }
    func sendCodeToRegisterUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage)
        receiveCodeView.receiveCodeBtn.isEnabled = true
    }

    func verifyCodeSuccessfully() {
        enterCodeView.isHidden = true

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true

        if receiveCodeAction == .register{
            setupRegisterView()
            registerView.isHidden = false
        }else{
            setupResetPasswordView()
            resetPasswordView.isHidden = false
        }
    }
    func verifyCodeUnsuccessfully(errorCode: String, errorMessage: String) {
        ViewHelper.userActionsToastView(message: errorMessage)

        enterCodeView.sendCodeBtn.isEnabled = true
        enterCodeView.editEmailBtn.isEnabled = true
    }

    func resetPasswordSuccessfully() {

        resetPasswordView.isHidden = true
        resetPasswordView.resetPasswordBtn.isEnabled = true

        setupLoginView()

        loginView.isHidden = false
    }
    func resetPasswordUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage)

        resetPasswordView.resetPasswordBtn.isEnabled = true
    }

    func registerSuccessfully() {

        registerView.isHidden = true
        registerView.registerBtn.isEnabled = true

        setupLoginView()

        loginView.isHidden = false
    }
    func registerUnsuccessfully(errorCode: String, errorMessage: String) {

        ViewHelper.userActionsToastView(message: errorMessage)

        registerView.registerBtn.isEnabled = true
    }

    func changeEmailSuccessfully() {

    }
    func changeEmailUnsuccessfully(errorCode: String, errorMessage: String) {

    }

    func getUserDetailsSuccessfully() {

    }
    func getUserDetailsUnsuccessfully(errorCode: String, errorMessage: String) {

    }

    func resetCodeSuccessfully() {

    }
    func resetCodeUnsuccessfully(errorCode: String, errorMessage: String) {

    }

    func validateTokenSuccessfully() {

    }
    func validateTokenUnsuccessfully(errorCode: String, errorMessage: String) {

    }

}
