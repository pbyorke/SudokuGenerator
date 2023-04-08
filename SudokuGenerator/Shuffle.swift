//
//  Shuffle.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/7/23.
//

import Foundation

class Shuffle {
    
    private var vm = ViewModel.shared
    
    func run() {
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
                if vm.data[x][y].value == n1 {
                    vm.data[x][y].value = n2
                } else if vm.data[x][y].value == n2 {
                    vm.data[x][y].value = n1
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
        let row = vm.data[r1]
        vm.data[r1] = vm.data[r2]
        vm.data[r2] = row
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
            let colVal = vm.data[i][c1]
            vm.data[i][c1] = vm.data[i][c2]
            vm.data[i][c2] = colVal
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
