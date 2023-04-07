//
//  Board.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Board: View {
    
    @EnvironmentObject private var vm: ViewModel

    var blocks: [[Block]]
    
    init() {
        blocks = [
            [
                Block(row: 0, col: 0),
                Block(row: 0, col: 3),
                Block(row: 0, col: 6),
            ],
            [
                Block(row: 3, col: 0),
                Block(row: 3, col: 3),
                Block(row: 3, col: 6),
            ],
            [
                Block(row: 6, col: 0),
                Block(row: 6, col: 3),
                Block(row: 6, col: 6),
            ],
        ]
    }
    
    var body: some View {
        VStack {
            HStack {
                blocks[0][0]
                blocks[0][1]
                blocks[0][2]
            }
            HStack {
                blocks[1][0]
                blocks[1][1]
                blocks[1][2]
            }
            HStack {
                blocks[2][0]
                blocks[2][1]
                blocks[2][2]
            }
        }
    }
    
}

// MARK: - previews

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
            .environmentObject(ViewModel.shared)
    }
}
