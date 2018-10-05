//
//  ExtDictionary.swift
//  Lc
//
//  Created by Luciano Calderano on 2018
//  Copyright © 2018 Lc. All rights reserved.
//

import Foundation
public extension Dictionary {
    private func value<T>(_ keys: String) -> T? {
        let array = keys.components(separatedBy: "->")
        
        var dic = self as! Dictionary<String, Any>
        for key in array.dropLast() {
            guard let next = dic[key] as? Dictionary<String, Any> else {
                return nil
            }
            dic = next // as! Dictionary<String, Any>
        }
        
        if let k = array.last, let value = dic[k] {
            return value as? T
        }
        return nil
    }
    
    func double (_ key: String) -> Double {
        if let s:String = value(key), let v = Double(s) {
            return v
        }
        return 0
    }
    
    func int (_ key: String) -> Int {
        if let s:String = value(key), let v = Int(s) {
            return v
        }
        return 0
    }
    
    func bool (_ key: String) -> Bool {
        if let v:String = value(key) {
            return v == "1" || v.lowercased() == "true" || v.lowercased().left(lenght: 1) == "y"
        }
        return false
    }
    
    func string (_ key: String) -> String {
        return value(key) ?? ""
    }
    
    func dictionary(_ key: String) -> Dictionary<Key, Value> {
        return value(key) ?? [:]
    }
    
    func array(_ key: String) -> Array<Any> {
        return value(key) ?? []
    }
    
    func date (_ key: String, fmt: String = "") -> Date? {
        if fmt.isEmpty {
            return value(key) ?? nil
        }
        
        if let ret:String = value(key) {
            return ret.isEmpty ? nil : ret.toDate(withFormat: fmt)
        }
        return nil
    }
}
