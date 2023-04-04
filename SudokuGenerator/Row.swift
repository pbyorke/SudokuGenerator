//
//  Row.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Row: View, Identifiable {
    
    @EnvironmentObject private var vm: ViewModel
    
    let id: Int
    let row: Int
    let cells: [Cell]
    
    /// initialze the Row by buildijng an array of Cells
    init(_ row: Int) {
        self.row = row
        self.id = row * 9
        var array = [Cell]()
        for i in 0...8 {
            array.append(Cell((row, i)))
        }
        self.cells = array
    }
    
    /// required body. Go through all the Cells and put each one in an HStack
    var body: some View {
        HStack {
            ForEach(cells, id: \.id) {
                $0
//                if $0.id % 9 == 2 || $0.id % 9 == 5 {
//                    Text(" ")
//                        .frame(width: 5, height: 5)
//                }
            }
        }
        .padding(.horizontal)
    }
    
}

// MARK: - previews

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(0)
            .environmentObject(ViewModel.shared)
    }
}
