//
//  CellData.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/12/23.
//

struct CellData {
    
    var row: Int
    var col: Int
    var value: Int
    var open: Bool
    var valid: Bool
    var reach: Bool
    
    init(_ row: Int, _ col: Int, _ value: Int) {
        self.row = row
        self.col = col
        self.value = value
        self.open = true
        self.valid = true
        self.reach = false
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
    
    func dump() {
        print("")
        print("CellData")
        print("  row   \(row)")
        print("  col   \(col)")
        print("  value \(value)")
        print("  reach \(reach)")
    }
    
}
