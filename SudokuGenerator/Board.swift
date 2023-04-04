//
//  Board.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Board: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    var rows: [Row]
    
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
    
}

// MARK: - previews

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board()
            .environmentObject(ViewModel.shared)
    }
}
