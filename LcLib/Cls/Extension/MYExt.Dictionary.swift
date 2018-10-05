//
//  ExtDictionary.swift
//  Lc
//
//  Created by Luciano Calderano on 2018
//  Copyright © 2018 Lc. All rights reserved.
//

import Foundation
public extension Dictionary {
    private func value (_ keys: String) -> Any? {
        let array = keys.components(separatedBy: "->")
        
        var dic = self as! Dictionary<String, Any>
        for key in array.dropLast() {
            guard let next = dic[key] as? Dictionary<String, Any> else {
                return nil
            }
            dic = next
        }
        
        if let k = array.last, let value = dic[k] {
            return value
        }
        return nil
    }
    
    func double (_ key: String) -> Double {
        if let s = value(key) as? String, let v = Double(s) {
            return v
        }
        return 0
    }
    
    func int (_ key: String) -> Int {
        if let s = value(key) as? String, let v = Int(s) {
            return v
        }
        return 0
    }
    
    func bool (_ key: String) -> Bool {
        if let s = value(key) as? String {
            return s == "1" || s.lowercased() == "true" || s.lowercased().left(lenght: 1) == "y"
        }
        return false
    }
    
    func string (_ key: String) -> String {
        if let s = value(key) as? String {
            return s
        }
        return ""
    }
    
    func dictionary(_ key: String) -> Dictionary<Key, Value> {
        if let dict = value(key) as? Dictionary<Key, Value> {
            return dict
        }
        return [:]
    }
    
    func array(_ key: String) -> Array<Any> {
        if let arr = value(key) as? Array<Any> {
            return arr
        }
        return []
    }
    
    func date (_ key: String, fmt: String = "") -> Date? {
        if fmt.isEmpty {
            if let d = value(key) as? Date {
                return d
            }
        } else {
            if let s = value(key) as? String, s.count > 0 {
                return s.toDate(withFormat: fmt)
            }
        }
        return nil
    }
}
