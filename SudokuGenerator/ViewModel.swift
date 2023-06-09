//
//  ViewModel.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//
//  https://stackoverflow.com/questions/6924216/how-to-generate-sudoku-boards-with-unique-solutions
//

import SwiftUI

class ViewModel: ObservableObject {
    
    static var shared = ViewModel()
    
    @Published var selected = (row: -1, col: -1)
    
    @Published var data = [
        [1,2,3, 4,5,6, 7,8,9],
        [4,5,6, 7,8,9, 1,2,3],
        [7,8,9, 1,2,3, 4,5,6],
        
        [2,3,1, 5,6,4, 8,9,7],
        [5,6,4, 8,9,7, 2,3,1],
        [8,9,7, 2,3,1, 5,6,4],
        
        [3,1,2, 6,4,5, 9,7,8],
        [6,4,5, 9,7,8, 3,1,2],
        [9,7,8, 3,1,2, 6,4,5],
    ]
    
    var board: Board
    
    private init() {
        board = Board()
    }
    
    func tap(_ cell: Cell) {
        if isSelected(cell) {
            selected = (-1, -1)
        } else {
            selected = (cell.pos)
        }
    }
    
    func isSelected(_ cell: Cell) -> Bool {
        return cell.pos == selected
    }
    
    func isSelection() -> Bool {
        return selected == (-1, -1)
    }
    
    func dump() {
        board.dump()
    }
    
    func shuffle() {
        shuffleNumbers()
        shuffleRows()
        shuffleCols()
    }
    
    private func shuffleNumbers() {
        for i in 1...9 {
            let ranNum = Int.random(in: 1...9)
            swapNumbers(i, ranNum)
        }
    }

    private func swapNumbers(_ n1: Int, _ n2: Int) {
        for y in 0..<9 {
            for x in 0..<9 {
                if data[x][y] == n1 {
                    data[x][y] = n2
                } else if data[x][y] == n2 {
                    data[x][y] = n1
                }
            }
        }
    }

    private func shuffleRows() {
        for i in 0..<9 {
            let ranNum = Int.random(in: 0..<3)
            let blockNumber = i / 3
            swapRows(i, blockNumber * 3 + ranNum)
        }
    }

    private func swapRows(_ r1: Int, _ r2: Int) {
        let row = data[r1]
        data[r1] = data[r2]
        data[r2] = row
    }

    private func shuffleCols() {
        for i in 0..<9 {
            let ranNum = Int.random(in: 0..<3)
            let blockNumber = i / 3
            swapCols(i, blockNumber * 3 + ranNum)
        }
    }

    private func swapCols(_ c1: Int, _ c2: Int) {
        for i in 0..<9 {
            let colVal = data[i][c1]
            data[i][c1] = data[i][c2]
            data[i][c2] = colVal
        }
    }

    private func ahuffle3x3Rows() {
        for i in 0..<3 {
            let ranNum = Int.random(in: 0..<3)
            swap3x3Rows(i, ranNum)
        }
    }

    private func swap3x3Rows(_ r1: Int, _ r2: Int) {
        for i in 0..<3 {
            swapRows(r1 * 3 + i, r2 * 3 + i)
        }
    }

    private func shuffle3x3Cols() {
        for i in 0..<3 {
            let ranNum = Int.random(in: 0..<3)
            swap3x3Cols(i, ranNum)
        }
    }

    private func swap3x3Cols(_ c1: Int, _ c2: Int) {
        for i in 0..<3 {
            swapCols(c1 * 3 + i, c2 * 3 + i)
        }
    }
        
}
