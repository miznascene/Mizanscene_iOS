//
//  MainViewController.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/05 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit
import paper_onboarding

class MainViewController: UIViewController {

    let pages = [OnboardingItemInfo(informationImage: UIImage(named: "Image")!,
        title: "title1",
        description: "description1",
        pageIcon: UIImage(named: "Image")!,
        color: .lightGray,
        titleColor: .blue,
        descriptionColor: .red,
        titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
        descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)),
        OnboardingItemInfo(informationImage: UIImage(named: "Image")!,
            title: "title2",
            description: "description2",
            pageIcon: UIImage(named: "Image")!,
            color: .lightGray,
            titleColor: .blue,
            descriptionColor: .red,
            titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
            descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)),
        OnboardingItemInfo(informationImage: UIImage(named: "Image")!,
            title: "title3",
            description: "description3",
            pageIcon: UIImage(named: "Image")!,
            color: .lightGray,
            titleColor: .blue,
            descriptionColor: .red,
            titleFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin),
            descriptionFont: UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupPaperOnboardingView()
//        setupLoginView()
//        setupResetPasswordView()
//        setupReceiveCodeView()
        setupRegisterView()
    }

    private func setupPaperOnboardingView() {
        let onboardingView = PaperOnboarding()
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
        skipButton.frame = CGRect(x: self.view.frame.size.width - 70, y: 50, width: 50, height: 50)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)

        self.view.addSubview(skipButton)

        view.bringSubviewToFront(skipButton)
    }

    @objc func skipButtonAction(sender: UIButton!) {
    }

    private func setupLoginView() {
        if let loginView = Bundle.main.loadNibNamed("Login", owner: self, options: nil)?.first as? LoginView {
            loginView.setViews()
            loginView.loginBtn.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
            loginView.gotoRegisterBtn.addTarget(self, action: #selector(gotoRegisterButtonAction), for: .touchUpInside)
            loginView.forgetPasswordBtn.addTarget(self, action: #selector(forgetPasswordButtonAction), for: .touchUpInside)
            self.view.addSubview(loginView)
        }
    }

    @objc func loginButtonAction(sender: UIButton!) {
    }
    @objc func gotoRegisterButtonAction(sender: UIButton!) {
    }
    @objc func forgetPasswordButtonAction(sender: UIButton!) {
    }

    private func setupResetPasswordView() {
        if let resetPasswordView = Bundle.main.loadNibNamed("ResetPassword", owner: self, options: nil)?.first as? ResetPasswordView {
            resetPasswordView.setViews()
            resetPasswordView.resetPasswordBtn.addTarget(self, action: #selector(resetPasswordButtonAction), for: .touchUpInside)
            self.view.addSubview(resetPasswordView)
        }
    }
    @objc func resetPasswordButtonAction(sender: UIButton!) {
    }

    private func setupReceiveCodeView() {
        if let receiveCodeView = Bundle.main.loadNibNamed("ReceiveCode", owner: self, options: nil)?.first as? ReceiveCodeView {
            receiveCodeView.setViews()
            receiveCodeView.receiveCodeBtn.addTarget(self, action: #selector(receiveCodeButtonAction), for: .touchUpInside)
            self.view.addSubview(receiveCodeView)
        }
    }

    @objc func receiveCodeButtonAction(sender: UIButton!) {
    }

    private func setupRegisterView() {
        if let registerView = Bundle.main.loadNibNamed("Register", owner: self, options: nil)?.first as? RegisterView {
            registerView.setViews()
            registerView.registerBtn.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
            self.view.addSubview(registerView)
        }
    }

    @objc func registerButtonAction(sender: UIButton!) {

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
