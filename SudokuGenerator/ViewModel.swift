//
//  ViewModel.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
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
    
    func reset(_ row: Int, _ col: Int) {
        data[row][col] = 0
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
    
}
