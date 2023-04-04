//
//  CellExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/4/23.
//

import Foundation

extension Cell {
    
    /// dump the contents of this Cell
    func dump() {
        print("* * *    Cell pos (\(pos.row), \(pos.col)) data \(value))")
    }
    
}
