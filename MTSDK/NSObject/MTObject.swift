//
//  MTObject.swift
//  MTSDK
//
//  Created by Songoku on 11/9/20.
//

import Foundation

public extension NSObject {
    @nonobjc class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
