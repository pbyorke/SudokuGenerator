//
//  ViewModelExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/30/23.
//

import Foundation

extension ViewModel {
    
    func dumpEnvironment() {
        print("environment")
        print("  selectedRow \(selectedRow)    selectedCol   \(selectedCol)")
        print("  allCorrect  \(isAllCorrect ? "true " : "false") showingErrors \(isShowingErrors ? "true " : "false")")
        print("  atLeastOne  \(atLeastOneExclusion ? "true " : "false") step          \(step.name)")
        print("  canUndo     \(canUndo ? "true " : "false") canRedo       \(canRedo ? "true " : "false")")
        print("")
    }

    func audit() {
        
        var fault = false
        
        for row in 0..<9 {
            for col in 0..<9 {
                if data[row][col].row != row || data[row][col].col != col {
                    print("ViewModel.audit() fault at \(row),\(col)")
                    fault = true
                }
            }
        }
        if !fault {
            print("ViewModel.fault() all tests passed")
        }
    }
    
}
