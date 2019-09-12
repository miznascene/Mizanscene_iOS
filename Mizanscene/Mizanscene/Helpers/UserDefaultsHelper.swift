//
//  UserDefaultsHelper.swift
//  Mizanscene
//
//  Created by negar on 98/Shahrivar/13 AP.
//  Copyright © 1398 negar. All rights reserved.
//

import UIKit

class UserDefaultsHelper: NSObject {

    class func getString(key: String) -> String
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil {
            return userDefaults.string(forKey: key)!
        }
        return ""
    }

    class func getString(key: String, defaultValue: String) -> String {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.string(forKey: key)!
        }
        return defaultValue
    }

    class func getBoolean(key: String) -> Bool
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.bool(forKey: key)
        }
        return false
    }

    class func getBoolean(key: String, defaultValue: Bool) -> Bool {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.bool(forKey: key)
        }
        return defaultValue
    }

    class func getInt(key: String) -> Int
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.integer(forKey: key)
        }
        return 0
    }

    class func getInt(key: String, defaultValue: Int) -> Int
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil {
            return userDefaults.integer(forKey: key)
        }
        return defaultValue
    }

    class func getArray(key: String) -> Array<AnyObject>
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.array(forKey: key)! as Array<AnyObject>
        }
        return [AnyObject]()

    }

    class func getData(key: String) -> Data
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.data(forKey: key)! as Data
        }
        return Data()
    }

    class func getDate(key: String) -> Date {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.object(forKey: key) as! Date
        }
        return Date()
    }

    class func getDictionary(key: String) -> Dictionary<NSObject, AnyObject>
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.dictionary(forKey: key)! as Dictionary<NSObject, AnyObject>
        }
        return Dictionary<NSObject, AnyObject>()
    }

    class func getDouble(key: String) -> Double
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.double(forKey: key)
        }
        return Double(0)
    }

    class func getFloat(key: String) -> Float
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.float(forKey: key)
        }
        return Float(0)

    }

    class func getObject(key: String) -> AnyObject
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: key) != nil{
            return userDefaults.object(forKey: key)! as AnyObject
        }
        return "" as AnyObject
    }

    class func setString(key: String, value: String)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setBool(key: String, value: Bool)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setInt(key: String, value: Int)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setDate(key: String, value: Date) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setData(key: String, value: Data)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setDictionary(key: String, value: Dictionary<NSObject, AnyObject>)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setDouble(key: String, value: Double)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setFloat(key: String, value: Float)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    class func setObject(key: String, value: AnyObject)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }

    static func remove(key: String)
    {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }

}
