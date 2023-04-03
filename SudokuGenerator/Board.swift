//
//  Board.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Board: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    private var rows: [Row]
    
    /// initialze the Board by buildijng an array of Rows
    init() {
        var array = [Row]()
        for i in 0...8 {
            array.append(Row(i))
        }
        self.rows = array
    }
    
    /// required body. Go through all the Rows and put each one in a VStack
    var body: some View {
        VStack {
            ForEach(rows, id: \.id) {
                $0
            }
        }
    }
    
    /// dump the whole Board
    func dump() {
        print("* * *  board")
        for row in rows {
            row.dump()
        }
    }
    
    /// tell a Row to dump itself
    /// - Parameter row: Row number
    func dump(_ row: Int) {
        rows[row].dump()
    }
    
    /// tell a row to tell a Cell to dump itselfØ
    /// - Parameters:
    ///   - row: Row number
    ///   - col: Cell number
    func dump(_ row: Int, _ col: Int) {
        rows[row].dump(col)
    }
    
}

// MARK: - previews

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
            .environmentObject(ViewModel.shared)
    }
}
