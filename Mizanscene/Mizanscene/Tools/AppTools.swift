//
//  AppTools.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation

class AppTools : NSObject{

    class func convertStringToBool(data:String) -> Bool {
        if data.isEmpty {
            return false
        }

        switch data.lowercased() {
        case "true", "yes", "1", "success", "200":
            return true
        default:
            return false
        }
    }
}
