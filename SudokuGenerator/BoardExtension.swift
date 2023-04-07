//
//  BoardExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/4/23.
//

import Foundation

extension Board {
    
    func dump() {
        for row in 0..<3 {
            for col in 0..<3 {
                blocks[row][col].dump()
            }
        }
    }
    
}
