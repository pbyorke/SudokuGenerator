//
//  Source.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/7/23.
//

import SwiftUI

struct Source: View {

    @EnvironmentObject private var vm: ViewModel
    
    var cells = [SourceCell]()
    
    init() {
        for col in 1...9 {
            cells.append(SourceCell(value: col))
        }
    }
    
    var body: some View {
            HStack(spacing: 0) {
                cells[0]
                cells[1]
                cells[2]
                cells[3]
                cells[4]
                cells[5]
                cells[6]
                cells[7]
                cells[8]
            }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(lineWidth: 3)
        )
    }

}

// MARK: - previews

struct Source_Previews: PreviewProvider {
    static var previews: some View {
        Block(row: 0, col: 0)
    }
}
