//
//  CellData.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/12/23.
//

struct CellData {
    
    var row:    Int
    var col:    Int
    var value:  Int
    var clue:   Bool
    var error:  Bool

    init(_ row: Int, _ col: Int, _ value: Int) {
        self.row =      row
        self.col =      col
        self.value =    value
        self.clue =     value != 0
        self.error =    false
    }
    
    init(_ cell: CellData, _ newValue: Int) {
        row =   cell.row
        col =   cell.col
        value = newValue
        clue =  value != 0
        error = cell.error
    }
    
    func equals(_ search: CellData) -> Bool {
        if value == 0 {
            return false
        }
        if !(row == search.row && col == search.col) {
            if value == search.value {
                return true
            }
        }
        return false
    }
    
}
