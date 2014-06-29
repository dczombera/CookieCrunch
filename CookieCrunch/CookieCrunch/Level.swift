//
//  Level.swift
//  CookieCrunch
//
//  Created by milch on 27.06.14.
//  Copyright (c) 2014 Dennis Czombera inc. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    let cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    let tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    
    init(filename: String) {
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            if let tilesArray: AnyObject = dictionary["tiles"] {
                
                for (row, rowArray) in enumerate(tilesArray as Int[][]) {
                    let tileRow = NumRows - row - 1
                    
                    for (column, value) in enumerate(rowArray) {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()
                        }
                    }
                }
            }
        }
    }
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffel() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    func createInitialCookies() -> Set<Cookie> {
        var cookieSet = Set<Cookie>()
        
        for row in 0..NumRows {
            for column in 0..NumColumns {
                if tiles[column, row] != nil {
                    let cookie = Cookie(column: column, row: row, cookieType: CookieType.random())
                    
                    cookies[column, row] = cookie
                    cookieSet.addElement(cookie)
                }
            }
        }
        
        return cookieSet
    }
}