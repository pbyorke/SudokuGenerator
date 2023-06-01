//
//  CellDataExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/31/23.
//

import Foundation

extension CellData {
        
    func dump() {
        print("CellData row \(row) col \(col) value \(value) clue \(clue ? "true " : "false") error \(error ? "true " : "false")")
    }
    
}
