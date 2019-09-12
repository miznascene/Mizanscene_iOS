//
//  Cast.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/13 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cast: NSObject {
    var cast_id = 0
    var cast_name = ""
    var cast_image = ""
    var cast_order = ""
    //    var cast_role = ""

    class func buildSingle(jsonData: JSON) -> Cast {

        let cast = Cast()

        cast.cast_id = jsonData["cast_id"].intValue
        cast.cast_name = jsonData["cast_name"].stringValue
        cast.cast_image = jsonData["cast_image"].stringValue
        cast.cast_order = jsonData["cast_order"].stringValue
        //        cast.cast_role = jsonData["cast_role"].stringValue

        return cast
    }

    class func buildList(jsonData: JSON) -> [Cast] {

        var casts = [Cast]()

        for index in 0..<jsonData.count {
            casts.append(Cast.buildSingle(jsonData: jsonData[index]))
        }
        return casts
    }
}
