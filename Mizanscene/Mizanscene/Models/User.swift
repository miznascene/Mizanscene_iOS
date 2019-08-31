//
//  User.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: Codable {

    var id = 0
    var userName = ""
    var email = ""
    var token = ""

    var firstName = ""
    var lastName = ""
    var userPicture = ""
    var isSubscribed = false

    enum CodingKeys: String, CodingKey {
        case id
        case userName
        case email
        case token

        case firstName
        case lastName
        case userPicture
        case isSubscribed
    }

    class func buildSingle(jsonData: JSON) -> User {
        let user = User()

        user.id = jsonData["id"].intValue
        user.userName = jsonData["username"].stringValue
        user.token = jsonData["token"].stringValue
        user.email = jsonData["email"].stringValue
        user.isSubscribed = jsonData["isSubscribed"].boolValue

        if jsonData["first_name"].stringValue.count != 0{
            user.firstName = jsonData["first_name"].stringValue
        }
        if jsonData["last_name"].stringValue.count != 0{
            user.lastName = jsonData["last_name"].stringValue
        }
        if jsonData["user_picture"].stringValue.count != 0{
            user.userPicture = jsonData["user_picture"].stringValue
        }

        return user
    }

}
