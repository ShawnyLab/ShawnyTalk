//
//  String+Date.swift
//  ShawnyTalk
//
//  Created by 박진서 on 2022/12/26.
//

import Foundation

extension Date {
    var second: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "ss"
        return Int(formatter.string(from: self))!
    }
    
    var minute: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "mm"
        return Int(formatter.string(from: self))!
    }
    
    var hour: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "HH"
        return Int(formatter.string(from: self))!
    }
    
    var day: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "dd"
        return Int(formatter.string(from: self))!
    }
    
    var month: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MM"
        return Int(formatter.string(from: self))!
    }
    
    var year: Int {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy"
        return Int(formatter.string(from: self))!
    }
    
    var hourAndMinute: String {
        return "\(self.hour): \(self.minute)"
    }
}
