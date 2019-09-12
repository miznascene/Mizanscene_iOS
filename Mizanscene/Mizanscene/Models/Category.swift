//
//  Category.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/13 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category: NSObject {
    var movie_cat_id = 0
    var movie_cat_name = ""

    class func buildSingle(jsonData: JSON) -> Category {

        let category = Category()

        category.movie_cat_id = jsonData["movie_cat_id"].intValue
        category.movie_cat_name = jsonData["movie_cat_name"].stringValue

        return category
    }

    class func buildList(jsonData: JSON) -> [Category] {
        var categories = [Category]()
        for index in 0..<jsonData.count {
            categories.append(Category.buildSingle(jsonData: jsonData[index]))
        }
        return categories
    }
}
