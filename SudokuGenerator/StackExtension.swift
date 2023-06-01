//
//  StackExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/31/23.
//

import Foundation

extension Stack {
    
    func dump(_ title: String = "") {
        print("* * *  Stack.dump() \(title)")
        print("* * *    done stack")
        for play in done {
            play.dump()
        }
        print("* * *    undone stack")
        for play in undone {
            play.dump()
        }
        print("")
    }
    
}
