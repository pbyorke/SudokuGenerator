//
//  Cell.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Cell: View {

    @EnvironmentObject private var vm: ViewModel

    let id, row, col: Int
    var value: Int { vm.data[row][col] }

    init(row: Int, col: Int) {
        self.row = row
        self.col = col
        self.id = row * 9 + col
    }
    
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
        Cell(row: 0, col: 0)
            .environmentObject(ViewModel.shared)
    }
}
