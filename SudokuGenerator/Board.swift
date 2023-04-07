//
//  Board.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Board: View {
    
    @EnvironmentObject private var vm: ViewModel

    var board: [[Block]]
    
    init() {
        board = [
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
                board[0][0]
                board[0][1]
                board[0][2]
            }
            HStack {
                board[1][0]
                board[1][1]
                board[1][2]
            }
            HStack {
                board[2][0]
                board[2][1]
                board[2][2]
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
