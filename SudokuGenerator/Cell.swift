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
    let rowNumber: Int
    let colNumber: Int
    private var value: Int { vm.data[rowNumber][colNumber] }
    
    /// initialze the Cell, storing the Row number and Cell number
    init(_ rowNumber: Int, _ colNumber: Int) {
        self.rowNumber = rowNumber
        self.colNumber = colNumber
        self.id = rowNumber * 9 + colNumber
    }
    
    /// required body. Display a number if >0, else black
    var body: some View {
        Text(value == 0 ? " " : "\(value)")
            .frame(width: 30, height: 30)
            .font(.system(size: 24))
            .border(.black)
    }
    
    /// dump the contents of this Cell
    func dump() {
        print("* * *    Cell row \(rowNumber) col \(colNumber) data \(value)")
    }
    
}

// MARK: - previews

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(0, 0)
            .environmentObject(ViewModel.shared)
    }
}
