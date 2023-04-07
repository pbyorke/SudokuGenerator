//
//  BlockExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/6/23.
//

import Foundation

extension Block {
    
    func dump() {
        print("* * *   Block")
        for row in 0..<3 {
            for col in 0..<3 {
                block[row][col].dump()
            }
        }
    }
    
}
