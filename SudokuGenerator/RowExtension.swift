//
//  RowExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/4/23.
//

import Foundation

extension Row {
    
    /// dump the whole Row
    func dump() {
        print("* * *   Row \(row)")
        for cell in cells {
            cell.dump()
        }
    }
    
    /// tell a Cell to dump itself
    /// - Parameter col: Cell numberr
    func dump(_ col: Int) {
        cells[col].dump()
    }
    
}
