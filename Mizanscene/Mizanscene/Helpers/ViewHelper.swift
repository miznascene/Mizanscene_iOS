//
//  ViewHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import UIKit

class ViewHelper {

    class func showToastMessage(message: String) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let holder = UIView(frame: CGRect.zero)
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.text = message
//        label.font = FontHelper.getFooFont(size: 13)
        label.adjustsFontSizeToFitWidth = true
        holder.backgroundColor = UIColor.black
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.sizeToFit()
        label.numberOfLines = 4
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3

        holder.frame = CGRect(x: 0, y: -64, width: appDelegate.window!.frame.size.width, height: 64)
        label.frame = CGRect(x: 0, y: 20, width: appDelegate.window!.frame.size.width, height: 44)

        label.alpha = 1
        holder.addSubview(label)
        appDelegate.window!.addSubview(holder)
        //        appDelegate.window!.addSubview(label)

        var basketTopFrame = holder.frame
        basketTopFrame.origin.y = 0
        //        basketTopFrame.origin.x = 0

        UIView.animate(withDuration
                : 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
                    //                label.frame = basketTopFrame
                    holder.frame = basketTopFrame
            }, completion: {
                    (value: Bool) in
                    UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                        holder.frame = CGRect(x: 0, y: -64, width: appDelegate.window!.frame.size.width, height: 64)
                    }, completion: {
                            (value: Bool) in
                            holder.removeFromSuperview()
                        })
            })
    }

    class func userActionsToastView(message: String, frameColor: UIColor, textColor: UIColor) {

        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

        let holder = UIView(frame: CGRect.zero)
        let label = UILabel(frame: CGRect.zero)


        label.textAlignment = NSTextAlignment.center
        label.text = message
        //        label.font = FontHelper.getFooFont(size: 13)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .white
        label.layer.borderWidth = 2
        label.layer.borderColor = frameColor.cgColor
        label.textColor = textColor

        label.sizeToFit()
        label.numberOfLines = 4

        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true

        if ValueKeeper.language == "fa"{
            label.font = label.font.withSize(15)
        }

        holder.frame = CGRect(x: 12, y: -80, width: appDelegate.window!.frame.size.width-24, height: 80)
        label.frame = CGRect(x: 10, y: 40, width: holder.frame.size.width-20, height: 40)

        label.alpha = 1
        holder.addSubview(label)

        appDelegate.window!.addSubview(holder)
        //        appDelegate.window!.addSubview(label)

        var basketTopFrame = holder.frame
        basketTopFrame.origin.y = 0
        //        basketTopFrame.origin.x = 0

        UIView.animate(withDuration
            : 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
                //                label.frame = basketTopFrame
                holder.frame = basketTopFrame
        }, completion: {
            (value: Bool) in
            UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
                holder.frame = CGRect(x: 12, y: -64, width: appDelegate.window!.frame.size.width-24, height: 64)
            }, completion: {
                (value: Bool) in
                holder.removeFromSuperview()
            })
        })
    }

    class func makePinkBackView(x: Double, y: Double) -> UIView{

        let width = Double(UIScreen.main.bounds.width) - 100
        let height = Double(UIScreen.main.bounds.height) - y

        let pinkView = UIView()
        pinkView.frame = CGRect(x: x, y: y, width: width, height: height)
        pinkView.backgroundColor = ValueKeeper.primaryPinkColor
        pinkView.layer.cornerRadius = 8
        pinkView.layer.masksToBounds = true
        return pinkView
    }
}
