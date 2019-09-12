//
//  APIHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/09 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class APIHelper: NSObject {
    private let BASE_URL = "https://mizanscene.com/wp-json/mobile/v1/"
    private var token = ""

    static let shared = APIHelper()

    func setToken(token: String) {
        self.token = token
    }

    func getToken() -> String {
        return self.token
    }

    func sendGetRequest(urlString: String, onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {

        let urlComponent = URLComponents(string: BASE_URL + urlString)!

        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendGetRequest(urlString: String, queries: [String: String], onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {

        var urlComponent = URLComponents(string: BASE_URL + urlString)!
        let queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems

        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendPostRequest(urlString: String, queries: [String: String], params: [String: AnyObject], onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {
        var urlComponent = URLComponents(string: BASE_URL + urlString)!
        let queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems

        var request = URLRequest(url: urlComponent.url!)

        do {
            let jsonInfo = try
                JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonInfo
        } catch {
            print("ERROR")
            return
        }
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendPostRequest(urlString: String, params: [String: AnyObject], onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {

        let urlComponent = URLComponents(string: BASE_URL + urlString)!
        var request = URLRequest(url: urlComponent.url!)
        do {
            let jsonInfo = try
                JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonInfo
        } catch {
            print("ERROR")
            return
        }
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendPutRequest(urlString: String, queries: [String: String], params: [String: AnyObject], onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {
        var urlComponent = URLComponents(string: BASE_URL + urlString)!
        let queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent.queryItems = queryItems

        var request = URLRequest(url: urlComponent.url!)
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendPutRequest(urlString: String, params: [String: AnyObject], onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {

        let urlComponent = URLComponents(string: BASE_URL + urlString)!
        var request = URLRequest(url: urlComponent.url!)
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if token != "" {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        _ = Alamofire.request(request).responseJSON(completionHandler: { (response) in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.checkStatus(json: json, onCompletion: onCompletion)

            case .failure(let error):
                let status = ["error": "\(error)"]
                let json = JSON(status)
                onCompletion(false, json, json, json)
            }
        })
    }

    func sendPostMPReq(urlString: String, queries: [String: String], params: [String: AnyObject], image: UIImage?, onCompletion: @escaping(Bool, JSON, JSON, JSON) -> Void) {

        let url = BASE_URL + urlString

        if token != "" {

            let headerWithToken: HTTPHeaders = [
                "Authorization": "Bearer \(token)",
                "Content-Type": "application/json"
            ]

            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if let images = image, let imageData = images.jpegData(compressionQuality: 0.8) {

                    multipartFormData.append(imageData, withName: "image", fileName: "photo.jpeg", mimeType: "jpg/png")
                }

                for (key, value) in params {

                    if value is String || value is Int {

                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                    }
                }
            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headerWithToken) { (multipartFormDataEncodingResult) in

            }
        }
    }


    func checkStatus(json: JSON, onCompletion: (Bool, JSON, JSON, JSON) -> Void) {
        let status = AppTools.convertStringToBool(data: json["status"].stringValue)

        if status {
            onCompletion(status, json["code"], json["message"], json["data"])
        } else {
            onCompletion(status, json["code"], json["message"], json["data"])
        }
    }
}
