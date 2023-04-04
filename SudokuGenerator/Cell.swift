//
//  Cell.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Cell: View, Identifiable {
    
    @EnvironmentObject private var vm: ViewModel
    
    let id: Int
    let pos: (row: Int, col: Int)
    var value: Int { vm.data[pos.row][pos.col] }

    /// initialized the Cell, storing its row and column
    /// - Parameter pos: tuple containing (row, col)
    init(_ pos: (row: Int, col: Int)) {
        self.pos = pos
        self.id = pos.row * 9 + pos.col
    }
    
    /// required body. Display a number if >0, else black
    var body: some View {
        Text(value == 0 ? " " : "\(value)")
            .frame(width: 30, height: 30)
            .font(.system(size: 24))
            .overlay(
                vm.isSelected(self)
                ? RoundedRectangle(cornerRadius: 5).stroke(Color.red, lineWidth: 4)
                : RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1)
            )
            .onTapGesture {
                vm.tap(self)
            }
    }
    
}

// MARK: - previews

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell((0, 0))
            .environmentObject(ViewModel.shared)
    }
}
