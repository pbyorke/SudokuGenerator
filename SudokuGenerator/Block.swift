//
//  Block.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/5/23.
//

import SwiftUI

struct Block: View {

    @EnvironmentObject private var vm: ViewModel
    
    var cells: [[Cell]]
    
    init(row: Int, col: Int) {
        cells = [
            [
                Cell(row: row + 0, col: col + 0),
                Cell(row: row + 0, col: col + 1),
                Cell(row: row + 0, col: col + 2),
            ],
            [
                Cell(row: row + 1, col: col + 0),
                Cell(row: row + 1, col: col + 1),
                Cell(row: row + 1, col: col + 2),
            ],
            [
                Cell(row: row + 2, col: col + 0),
                Cell(row: row + 2, col: col + 1),
                Cell(row: row + 2, col: col + 2),
            ],
        ]
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                cells[0][0]
                cells[0][1]
                cells[0][2]
            }
            HStack(spacing: 0) {
                cells[1][0]
                cells[1][1]
                cells[1][2]
            }
            HStack(spacing: 0) {
                cells[2][0]
                cells[2][1]
                cells[2][2]
            }
        }
    }

}

// MARK: - previews

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        Block(row: 0, col: 0)
    }
}
