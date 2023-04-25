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

class ViewModel: ObservableObject {
    
    static var shared = ViewModel()
    
    @Published var selectedRow = -1
    @Published var selectedCol = -1
    @Published var isAllCorrect = false
    @Published var usedUpSource = [0,0,0,0,0,0,0,0,0,0]
    
    @Published var data = [
        [CellData(0,0,1),CellData(0,1,2),CellData(0,2,3),
         CellData(0,3,4),CellData(0,4,5),CellData(0,5,6),
         CellData(0,6,7),CellData(0,7,8),CellData(0,8,9)],
        [CellData(1,0,4),CellData(1,1,5),CellData(1,2,6),
         CellData(1,3,7),CellData(1,4,8),CellData(1,5,9),
         CellData(1,6,1),CellData(1,7,2),CellData(1,8,3)],
        [CellData(2,0,7),CellData(2,1,8),CellData(2,2,9),
         CellData(2,3,1),CellData(2,4,2),CellData(2,5,3),
         CellData(2,6,4),CellData(2,7,5),CellData(2,8,6)],
        
        
        [CellData(3,0,2),CellData(3,1,3),CellData(3,2,1),
         CellData(3,3,5),CellData(3,4,6),CellData(3,5,4),
         CellData(3,6,8),CellData(3,7,9),CellData(3,8,7)],
        [CellData(4,0,5),CellData(4,1,6),CellData(4,2,4),
         CellData(4,3,8),CellData(4,4,9),CellData(4,5,7),
         CellData(4,6,2),CellData(4,7,3),CellData(4,8,1)],
        [CellData(5,0,8),CellData(5,1,9),CellData(5,2,7),
         CellData(5,3,2),CellData(5,4,3),CellData(6,5,1),
         CellData(5,6,5),CellData(5,7,6),CellData(5,8,4)],
                
        
        [CellData(6,0,3),CellData(6,1,1),CellData(6,2,2),
         CellData(6,3,6),CellData(6,4,4),CellData(7,5,5),
         CellData(6,6,9),CellData(6,7,7),CellData(6,8,8)],
        [CellData(7,0,6),CellData(7,1,4),CellData(7,2,5),
         CellData(7,3,9),CellData(7,4,7),CellData(8,5,8),
         CellData(7,6,3),CellData(7,7,1),CellData(7,8,2)],
        [CellData(8,0,9),CellData(8,1,7),CellData(8,2,8),
         CellData(8,3,3),CellData(8,4,1),CellData(9,5,2),
         CellData(8,6,6),CellData(8,7,4),CellData(8,8,5)],
    ]
    
    var originalData = [
        [CellData(0,0,1),CellData(0,1,2),CellData(0,2,3),
         CellData(0,3,4),CellData(0,4,5),CellData(0,5,6),
         CellData(0,6,7),CellData(0,7,8),CellData(0,8,9)],
        [CellData(1,0,4),CellData(1,1,5),CellData(1,2,6),
         CellData(1,3,7),CellData(1,4,8),CellData(1,5,9),
         CellData(1,6,1),CellData(1,7,2),CellData(1,8,3)],
        [CellData(2,0,7),CellData(2,1,8),CellData(2,2,9),
         CellData(2,3,1),CellData(2,4,2),CellData(2,5,3),
         CellData(2,6,4),CellData(2,7,5),CellData(2,8,6)],
        
        
        [CellData(3,0,2),CellData(3,1,3),CellData(3,2,1),
         CellData(3,3,5),CellData(3,4,6),CellData(3,5,4),
         CellData(3,6,8),CellData(3,7,9),CellData(3,8,7)],
        [CellData(4,0,5),CellData(4,1,6),CellData(4,2,4),
         CellData(4,3,8),CellData(4,4,9),CellData(4,5,7),
         CellData(4,6,2),CellData(4,7,3),CellData(4,8,1)],
        [CellData(5,0,8),CellData(5,1,9),CellData(5,2,7),
         CellData(5,3,2),CellData(5,4,3),CellData(6,5,1),
         CellData(5,6,5),CellData(5,7,6),CellData(5,8,4)],
                
        
        [CellData(6,0,3),CellData(6,1,1),CellData(6,2,2),
         CellData(6,3,6),CellData(6,4,4),CellData(7,5,5),
         CellData(6,6,9),CellData(6,7,7),CellData(6,8,8)],
        [CellData(7,0,6),CellData(7,1,4),CellData(7,2,5),
         CellData(7,3,9),CellData(7,4,7),CellData(8,5,8),
         CellData(7,6,3),CellData(7,7,1),CellData(7,8,2)],
        [CellData(8,0,9),CellData(8,1,7),CellData(8,2,8),
         CellData(8,3,3),CellData(8,4,1),CellData(9,5,2),
         CellData(8,6,6),CellData(8,7,4),CellData(8,8,5)],
    ]
    
    private var running = false
    var isRunning: Bool { running }
    private var stack = Stack()
    var canUndo: Bool { stack.canUndo }
    var canRedo: Bool { stack.canRedo }

    func tapSource(_ value: Int) {
        if !isAllCorrect {
            if selectedRow >= 0 {
                if data[selectedRow][selectedCol].value == value {
                    stack.put(Play(row: selectedRow, col: selectedCol, oldValue: data[selectedRow][selectedCol].value, newValue: 0))
                    data[selectedRow][selectedCol].value = 0
                    lookForUsedUpSource()
                } else {
                    stack.put(Play(row: selectedRow, col: selectedCol, oldValue: data[selectedRow][selectedCol].value, newValue: value))
                    data[selectedRow][selectedCol].value = value
                    lookForUsedUpSource()
                }
            }
            if isEverythingFilled() {
                selectedRow = -1
                selectedCol = -1
                if andThereAreNoErrors() {
                    isAllCorrect = true
                }
            }
        }
    }
    
    private func lookForUsedUpSource() {
        for number in 0...9 { usedUpSource[number] = 0 }
        for row in 0...8 {
            for col in 0...8 {
                usedUpSource[data[row][col].value] += 1
            }
        }
    }
    
    func tapCell(_ cell: Cell) {
        if !isAllCorrect {
            if isRunning {
                if cell.row == selectedRow && cell.col == selectedCol {
                    selectedRow = -1
                    selectedCol = -1
                } else {
                    let cellData = data[cell.row][cell.col]
                    if cellData.open  || !cellData.valid {
                        selectedRow = cell.row
                        selectedCol = cell.col
                    }
                }
            }
        }
    }

    func shuffle() {
        Shuffle().run()
    }
    
    func exclude1() {
        while !isEverythingEmpty() {
            let row = Int.random(in: 0..<9)
            let col = Int.random(in: 0..<9)
            if data[row][col].value != 0 {
                data[row][col].value = 0
                return
            }
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
                data[row][col].open = true
            }
        }
        selectedRow = -1
        selectedCol = -1
        isAllCorrect = false
        running = false
        stack.reset()
    }
    
    func lock() {
        for row in 0..<9 {
            for col in 0..<9 {
                if data[row][col].value != 0 {
                    data[row][col].open = false
                }
            }
        }
        lookForUsedUpSource()
        running = true
    }
        
    private func isEverythingFilled() -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if data[row][col].value == 0 {
                    return false
                }
            }
        }
        return true
    }

    private func isEverythingEmpty() -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if data[row][col].value != 0 {
                    return false
                }
            }
        }
        return true
    }

    private func andThereAreNoErrors() -> Bool {
        var noErrorsFound = true
        for row in 0...8 {
            for col in 0...8 {
                data[row][col].valid = true
            }
        }
        if columnsHaveErrors() {
            noErrorsFound = false
        }
        if rowsHaveErrors() {
            noErrorsFound = false
        }
        if blocksHaveErrors() {
            noErrorsFound = false
        }
        return noErrorsFound
    }
    
    private func columnsHaveErrors() -> Bool {
        var errorsFound = false
        for row in 0...8 {
            var array = [CellData]()
            for col in 0...8 {
                array.append(data[row][col])
            }
            if analyzeArray(array) {
                errorsFound = true
            }
        }
        return errorsFound
    }
    
    private func rowsHaveErrors() -> Bool {
        var errorsFound = false
        for col in 0...8 {
            var array = [CellData]()
            for row in 0...8 {
                array.append(data[row][col])
            }
            if analyzeArray(array) {
                errorsFound = true
            }
        }
        return errorsFound
    }
    
    private func blocksHaveErrors() -> Bool {
        var array = [CellData]()
        var errorsFound = false
        for blockRow in 0...2 {
            for blockCol in 0...2 {
                array = [CellData]()
                for row in blockRow * 3...blockRow * 3 + 2 {
                    for col in blockCol * 3...blockCol * 3 + 2 {
                        array.append(data[row][col])
                    }
                }
                if analyzeArray(array) {
                    errorsFound = true
                }
            }
        }
        return errorsFound
    }

    private func analyzeArray(_ array: [CellData]) -> Bool {
        var thereAreErrors = false
        for base in array {
            for search in array {
                if search.equals(base) {
                    data[search.row][search.col].valid = false
                    thereAreErrors = true
                }
            }
        }
        return thereAreErrors
    }

    func chooseMyColor(_ cell: Cell) -> Color {
        let cellData = data[cell.row][cell.col]
        if isAllCorrect {
            if !data[cell.row][cell.col].open {
                return .lockGreen
            } else {
                return .unlockedGreen
            }
        }
        if cell.row == selectedRow && cell.col == selectedCol {
            if !data[cell.row][cell.col].valid {
                return .yellow
            } else {
                return .realYellow
            }
        }
        return cellData.valid ? cellData.open ? .white : .lockedCell : .red
    }
    
    func undo() {
        if let play = stack.undo() {
            data[play.row][play.col].value = play.oldValue
        }
    }
    
    func redo() {
        if let play = stack.redo() {
            data[play.row][play.col].value = play.newValue
        }
    }
    
}
