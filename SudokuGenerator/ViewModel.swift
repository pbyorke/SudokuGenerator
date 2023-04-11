//
//  ViewModel.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//
//  https://stackoverflow.com/questions/6924216/how-to-generate-sudoku-boards-with-unique-solutions
//  http://zhangroup.aporc.org/images/files/Paper_3485.pdf
//  https://www.kevinhooke.com/2021/07/23/grading-the-difficulty-of-a-sudoku-puzzle/
//  https://www.cs.mcgill.ca/~aassaf9/python/algorithm_x.html
//  https://medium.com/@rjchatfield/sudoku-solver-in-swift-on-vacation-74e9166277ed
//

import SwiftUI

enum CellType {
    case open
    case locked
    case error
}

struct CellData {
    var value: Int
    var type: CellType
    
    init(_ value: Int) {
        self.value = value
        self.type = .open
    }
}

class ViewModel: ObservableObject {
    
    static var shared = ViewModel()
    
    @Published var selectedRow = -1
    @Published var selectedCol = -1
    @Published var isAllCorrect = false
    @Published var isAllWrong = false
    
    @Published var data = [
        [CellData(1),CellData(2),CellData(3), CellData(4),CellData(5),CellData(6), CellData(7),CellData(8),CellData(9)],
        [CellData(4),CellData(5),CellData(6), CellData(7),CellData(8),CellData(9), CellData(1),CellData(2),CellData(3)],
        [CellData(7),CellData(8),CellData(9), CellData(1),CellData(2),CellData(3), CellData(4),CellData(5),CellData(6)],
        
        [CellData(2),CellData(3),CellData(1), CellData(5),CellData(6),CellData(4), CellData(8),CellData(9),CellData(7)],
        [CellData(5),CellData(6),CellData(4), CellData(8),CellData(9),CellData(7), CellData(2),CellData(3),CellData(1)],
        [CellData(8),CellData(9),CellData(7), CellData(2),CellData(3),CellData(1), CellData(5),CellData(6),CellData(4)],
        
        [CellData(3),CellData(1),CellData(2), CellData(6),CellData(4),CellData(5), CellData(9),CellData(7),CellData(8)],
        [CellData(6),CellData(4),CellData(5), CellData(9),CellData(7),CellData(8), CellData(3),CellData(1),CellData(2)],
        [CellData(9),CellData(7),CellData(8), CellData(3),CellData(1),CellData(2), CellData(6),CellData(4),CellData(5)],
    ]
    
    var originalData = [
        [CellData(1),CellData(2),CellData(3), CellData(4),CellData(5),CellData(6), CellData(7),CellData(8),CellData(9)],
        [CellData(4),CellData(5),CellData(6), CellData(7),CellData(8),CellData(9), CellData(1),CellData(2),CellData(3)],
        [CellData(7),CellData(8),CellData(9), CellData(1),CellData(2),CellData(3), CellData(4),CellData(5),CellData(6)],
        
        [CellData(2),CellData(3),CellData(1), CellData(5),CellData(6),CellData(4), CellData(8),CellData(9),CellData(7)],
        [CellData(5),CellData(6),CellData(4), CellData(8),CellData(9),CellData(7), CellData(2),CellData(3),CellData(1)],
        [CellData(8),CellData(9),CellData(7), CellData(2),CellData(3),CellData(1), CellData(5),CellData(6),CellData(4)],
        
        [CellData(3),CellData(1),CellData(2), CellData(6),CellData(4),CellData(5), CellData(9),CellData(7),CellData(8)],
        [CellData(6),CellData(4),CellData(5), CellData(9),CellData(7),CellData(8), CellData(3),CellData(1),CellData(2)],
        [CellData(9),CellData(7),CellData(8), CellData(3),CellData(1),CellData(2), CellData(6),CellData(4),CellData(5)],
    ]
    
    private var running = false
    
    func tapSource(_ value: Int) {
        if !isAllCorrect {
            if selectedRow >= 0 {
                if data[selectedRow][selectedCol].value == value {
                    data[selectedRow][selectedCol].value = 0
                } else {
                    data[selectedRow][selectedCol].value = value
                }
            }
            if isCompleted() {
                isAllCorrect = true
            }
        }
    }
    
    func tapCell(_ cell: Cell) {
        if !isAllCorrect {
                if cell.row == selectedRow && cell.col == selectedCol {
                selectedRow = -1
                selectedCol = -1
            } else {
                let cellData = data[cell.row][cell.col]
                if cellData.type == .open {
                    selectedRow = cell.row
                    selectedCol = cell.col
                }
            }
        }
    }

    var isRunning: Bool { running }

    func shuffle() {
        Shuffle().run()
    }
    
    func exclude1() {
        let row = Int.random(in: 0..<9)
        let col = Int.random(in: 0..<9)
        if data[row][col].value != 0 {
            data[row][col].value = 0
        }
    }
    
    func exclude10() {
        var count = 0
        while count < 11 {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if data[row][col].value != 0 {
                data[row][col].value = 0
                count += 1
            }
        }
    }
    
    func reset( ){
        data = originalData
        for row in 0..<9 {
            for col in 0..<9 {
                data[row][col].type = .open
            }
        }
        selectedRow = -1
        selectedCol = -1
        isAllCorrect = false
        running = false
    }
    
    func lock() {
        for row in 0..<9 {
            for col in 0..<9 {
                if data[row][col].value != 0 {
                    data[row][col].type = .locked
                }
            }
        }
        running = true
    }
    
    private func isCompleted() -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if data[row][col].value == 0 {
                    return false
                }
            }
        }
        isAllCorrect = true
        return true
    }
    
    func chooseMyColor(_ cell: Cell) ->Color {
        let cellData = data[cell.row][cell.col]
        if isAllCorrect {
            if data[cell.row][cell.col].type == .locked {
                return .lockGreen
            } else {
                return .realGreen
            }
        }
        if cell.row == selectedRow && cell.col == selectedCol {
            return .realYellow
        }
        switch cellData.type {
        case .open:     return .white
        case .locked:   return .realGrey
        case .error:    return .red
        }
    }
}
