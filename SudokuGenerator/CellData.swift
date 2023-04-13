//
//  CellData.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/12/23.
//

struct CellData {
    
    var value: Int
    var row: Int
    var col: Int
    var type: CellType
    
    init(_ row: Int, _ col: Int, _ value: Int) {
        self.row = row
        self.col = col
        self.value = value
        self.type = .open
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