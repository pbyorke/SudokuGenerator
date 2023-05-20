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

enum PlayStep { case shuffle, exclude, play }

class ViewModel: ObservableObject {
    
    static var shared = ViewModel()
    
    @Published var selectedRow = -3
    @Published var selectedCol = -3
    @Published var isAllCorrect = false
    @Published var usedUpSource = [0,0,0,0,0,0,0,0,0,0]
    @Published var isShowingUsed = false
    @Published var isShowingReach = false
    @Published var isShowingErrors = false
    @Published var atLeastOneExclusion = false
    @Published var step = PlayStep.shuffle
    @Published var notes = false
    
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
         CellData(5,3,2),CellData(5,4,3),CellData(5,5,1),
         CellData(5,6,5),CellData(5,7,6),CellData(5,8,4)],
        
        
        [CellData(6,0,3),CellData(6,1,1),CellData(6,2,2),
         CellData(6,3,6),CellData(6,4,4),CellData(6,5,5),
         CellData(6,6,9),CellData(6,7,7),CellData(6,8,8)],
        [CellData(7,0,6),CellData(7,1,4),CellData(7,2,5),
         CellData(7,3,9),CellData(7,4,7),CellData(7,5,8),
         CellData(7,6,3),CellData(7,7,1),CellData(7,8,2)],
        [CellData(8,0,9),CellData(8,1,7),CellData(8,2,8),
         CellData(8,3,3),CellData(8,4,1),CellData(8,5,2),
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
         CellData(5,3,2),CellData(5,4,3),CellData(5,5,1),
         CellData(5,6,5),CellData(5,7,6),CellData(5,8,4)],
        
        
        [CellData(6,0,3),CellData(6,1,1),CellData(6,2,2),
         CellData(6,3,6),CellData(6,4,4),CellData(6,5,5),
         CellData(6,6,9),CellData(6,7,7),CellData(6,8,8)],
        [CellData(7,0,6),CellData(7,1,4),CellData(7,2,5),
         CellData(7,3,9),CellData(7,4,7),CellData(7,5,8),
         CellData(7,6,3),CellData(7,7,1),CellData(7,8,2)],
        [CellData(8,0,9),CellData(8,1,7),CellData(8,2,8),
         CellData(8,3,3),CellData(8,4,1),CellData(8,5,2),
         CellData(8,6,6),CellData(8,7,4),CellData(8,8,5)],
    ]
    
    private var running = false
    var isRunning: Bool { running }
    private var stack = Stack()
    
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
                selectedRow = -3
                selectedCol = -3
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
                    selectedRow = -3
                    selectedCol = -3
                    calculateReach()
                    calculateErrors()
                } else {
                    let cellData = data[cell.row][cell.col]
                    if cellData.open  || !cellData.valid {
                        selectedRow = cell.row
                        selectedCol = cell.col
                        calculateReach()
                        calculateErrors()
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
                atLeastOneExclusion = true
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
        atLeastOneExclusion = true
    }
    
    func reset(){
        data = originalData
        selectedRow = -3
        selectedCol = -3
        isAllCorrect = false
        running = false
        atLeastOneExclusion = false
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
        var thereAreNoErrors = true
        for row in 0..<9 { for col in 0..<9 { data[row][col].valid = true }  }
        for row in 0..<9 {
            let array = sameRow(row)
            if dups(array) { thereAreNoErrors = false }
        }
        for col in 0..<9 {
            let array = sameCol(col)
            if dups(array) { thereAreNoErrors = false }
        }
        for non in 0..<9 {
            let array = sameNon(non)
            if dups(array) { thereAreNoErrors = false }
        }
        return thereAreNoErrors
    }

    private func dups(_ array: [CellData]) -> Bool {
//        for index in 0..<9 {
//            let cell = array[index]
//        }
        var thereAreDups = false
        for x in 0..<array.count - 1 {
            for y in x + 1..<array.count {
                if array[x].value == array[y].value {
                    if array[x].value != 0 {
                        let cellx = array[x]
                        let celly = array[y]
                        data[cellx.row][cellx.col].valid = false
                        data[celly.row][celly.col].valid = false
                        thereAreDups = true
                    }
                }
            }
        }
        return thereAreDups
    }

    private func calculateReach() {
        for row in 0..<9 {
            for col in 0..<9 {
                data[row][col].reach = false
            }
        }
        if isShowingReach {
            if selectedRow != -3 {
                let rows = sameRow(selectedRow)
                for row in rows {
                    if row.col != selectedCol {
                        if data[row.row][row.col].value == 0 {
                            data[row.row][row.col].reach = true
                        }
                    }
                }
                let cols = sameCol(selectedCol)
                for col in cols {
                    if col.row != selectedRow {
                        if data[col.row][col.col].value == 0 {
                            data[col.row][col.col].reach = true
                        }
                    }
                }
////                let nons = sameNon(row: selectedRow, col: selectedCol)
////                for non in nons {
////                    if non.row != selectedRow || non.col != selectedCol {
////                        if data[non.row][non.col].value == 0 {
////                            data[non.row][non.col].reach = true
////                        }
////                    }
////                }
            }
        }
    }
    
    private func calculateErrors() {
        for row in 0..<9 {
            for col in 0..<9 {
                data[row][col].valid = true
            }
        }
        if isShowingErrors {
            if selectedRow != -3 {
                let rows = sameRow(selectedRow)
                for row in rows {
                    if row.col != selectedCol {
                        if data[row.row][row.col].value == 0 {
                            data[row.row][row.col].valid = false
                        }
                    }
                }
                let cols = sameCol(selectedCol)
                for col in cols {
                    if col.row != selectedRow {
                        if data[col.row][col.col].value == 0 {
                            data[col.row][col.col].valid = false
                        }
                    }
                }
////                let nons = sameNon(row: selectedRow, col: selectedCol)
////                for non in nons {
////                    if non.row != selectedRow || non.col != selectedCol {
////                        if data[non.row][non.col].value == 0 {
////                            data[non.row][non.col].valid = false
////                        }
////                    }
////                }
            }
        }
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
        if data[cell.row][cell.col].reach {
            return .lightYellow
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
    
    
    
    
//    private func everythingIsFilled() -> Bool {
//        for row in 0..<9 {
//            for col in 0..<9 {
//                if data[row][col].value == 0 {
//                    return false
//                }
//            }
//        }
//        return true
//    }
    
    
    
    func chooseMyColorx(_ cell: Cell) -> Color {
        let cellData = data[cell.row][cell.col]
        if step != .play { return .white } // until we're playing, it's always white
        if isEverythingFilled() {
            
            
        }
        return .white
    }
    
    
    
    
    func undo() {
        if let play = stack.undo() {
            data[play.row][play.col].value = play.oldValue
            calculateReach()
            calculateErrors()
        }
    }
    
    func redo() {
        if let play = stack.redo() {
            data[play.row][play.col].value = play.newValue
            if isEverythingFilled() {
                selectedRow = -3
                selectedCol = -3
                if andThereAreNoErrors() {
                    isAllCorrect = true
                }
            }
            calculateReach()
            calculateErrors()
        }
    }
    
    func solve() {
        var grid = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
        for row in 0..<9 {
            for col in 0..<9 {
                grid[row][col] = data[row][col].value
            }
        }
        let solver = Sudoku.AlgorithmXSolver(size: 3, grid: grid)
        solver.run(grid)
    }
    
    private func sameRow(_ row: Int) -> [CellData] {
        var array = [CellData]()
        for col in 0..<9 {
            array.append(data[row][col])
        }
        return array
    }
    
    private func sameCol(_ col: Int) -> [CellData] {
        var array = [CellData]()
        for row in 0..<9 {
            array.append(data[row][col])
        }
        return array
    }

    private func sameNon(_ non: Int) -> [CellData] {
        var array = [CellData]()
        let rowStart = non / 3 * 3
        let colStart = non % 3 * 3
        for row in rowStart..<rowStart + 3 {
            for col in colStart..<colStart + 3 {
                array.append(data[row][col])
            }
        }
        return array
    }

    func onChangeIsShowingReach(value: Bool) {
        isShowingReach = value
        calculateReach()
    }
    
    func onChangeIsShowingErrors(value: Bool) {
        isShowingErrors = value
        calculateErrors()
    }
    
}
