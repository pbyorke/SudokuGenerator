//
//  Play.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/21/23.
//

struct Play {
    
    let oldCell, newCell: CellData

    init(_ cell: CellData, _ value: Int) {
        oldCell = cell
        newCell = CellData(cell, value)
    }

}
