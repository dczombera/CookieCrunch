//
//  Array2D.swift
//  CookieCrunch
//
//  Created by milch on 26.06.14.
//  Copyright (c) 2014 Dennis Czombera inc. All rights reserved.
//

class Array2D<T> {
    let columns: Int
    let rows: Int
    let array: Array<T?>
    
    init (columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: columns*rows, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * column + column]
        }
        set {
            array[row * column + column] = newValue
        }
    }
}
