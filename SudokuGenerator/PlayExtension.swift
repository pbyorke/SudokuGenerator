//
//  PlayExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/31/23.
//

import Foundation

extension Play {
    
    func dump() {
        print("Play")
        print("  newCell ", terminator: "")
        oldCell.dump()
        print("  oldCell ", terminator: "")
        newCell.dump()
    }
    
}
