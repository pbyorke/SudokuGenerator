//
//  Cell.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/1/23.
//

import SwiftUI

struct Cell: View {

    @EnvironmentObject private var vm: ViewModel

    let row, col: Int
    var value: Int { vm.data[row][col].value }
    var width: CGFloat { (UIScreen.main.bounds.width - 20) / 9 }

    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
    
    var body: some View {
        Text(value == 0 ? " " : "\(value)")
            .frame(width: width, height: width)
            .font(.system(size: 27))
            .background(
                vm.chooseMyColor(self)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 1)
            )
            .onTapGesture {
                vm.tapCell(self)
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
