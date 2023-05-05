//
//  Source.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/7/23.
//

import SwiftUI

struct Source: View {

    @EnvironmentObject private var vm: ViewModel
    
    private var cells = [SourceCell]()
    private var width: CGFloat { (UIScreen.main.bounds.width - 20) / 9 }

    init() {
        for col in 1...9 {
            cells.append(SourceCell(value: col))
        }
    }
    
    var body: some View {
            HStack(spacing: 0) {
//                Button {
//                    vm.undo()
//                } label: {
//                    HStack(spacing: 0) {
//                        Image(systemName: "arrow.uturn.backward")
//                    }
//                    .frame(width: width, height: width)
//                }
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
//                Button {
//                    vm.redo()
//                } label: {
//                    HStack(spacing: 0) {
//                        Image(systemName: "arrow.uturn.forward")
//                    }
//                    .frame(width: width, height: width)
//                }
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
