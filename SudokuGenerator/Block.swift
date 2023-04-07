//
//  Block.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/5/23.
//

import SwiftUI

struct Block: View {

    @EnvironmentObject private var vm: ViewModel
    
    var block: [[Cell]]
    
    init(row: Int, col: Int) {
        block = [
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
        VStack {
            HStack {
                block[0][0]
                block[0][1]
                block[0][2]
            }
            HStack {
                block[1][0]
                block[1][1]
                block[1][2]
            }
            HStack {
                block[2][0]
                block[2][1]
                block[2][2]
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
