//
//  BoardExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/4/23.
//

import Foundation

extension Board {
    
    /// dump the whole Board
    func dump() {
        print("* * *  board")
        for row in rows {
            row.dump()
        }
    }
    
    /// tell a Row to dump itself
    /// - Parameter row: Row number
    func dump(_ row: Int) {
        rows[row].dump()
    }
    
    /// tell a row to tell a Cell to dump itselfØ
    /// - Parameters:
    ///   - row: Row number
    ///   - col: Cell number
    func dump(_ row: Int, _ col: Int) {
        rows[row].dump(col)
    }
    
}
