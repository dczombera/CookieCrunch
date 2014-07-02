//
//  Swap.swift
//  CookieCrunch
//
//  Created by milch on 02.07.14.
//  Copyright (c) 2014 Dennis Czombera inc. All rights reserved.
//

class Swap: Printable {
    var cookieA: Cookie
    var cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}
