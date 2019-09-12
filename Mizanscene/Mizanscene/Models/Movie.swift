//
//  Movie.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie: NSObject {

    var id = 0
    var title = ""
    var descripton = ""
    var image = ""
    var stream_links = [String]()
    var categories = [Category]()
    var casts = [Cast]()

    class func buildSingle(jsonData: JSON) -> Movie {

        let BASE_URL = ""
        let movie = Movie()

        movie.id = jsonData["id"].intValue
        movie.title = jsonData["title"].stringValue

        if jsonData["descripton"].stringValue.count != 0 {
            movie.descripton = jsonData["descripton"].stringValue
        }

        if jsonData["image"].stringValue.count != 0 {
            movie.image = BASE_URL + jsonData["image"].stringValue
        }

        if jsonData["stream_links"].arrayValue.count != 0 {
            let streamLinks = jsonData["stream_links"].arrayValue
            for streamLink in streamLinks {
                movie.stream_links.append(streamLink.stringValue)
            }
        }
        if jsonData["categories"].arrayValue.count != 0 {
            movie.categories = Category.buildList(jsonData: jsonData["categories"])
        }

        if jsonData["casts"].arrayValue.count != 0 {
            movie.casts = Cast.buildList(jsonData: jsonData["casts"])
        }

        return movie
    }


    class func buildList(jsonData: JSON) -> [Movie] {
        var movies = [Movie]()
        for index in 0..<jsonData.count {
            movies.append(Movie.buildSingle(jsonData: jsonData[index]))
        }
        return movies
    }
}

