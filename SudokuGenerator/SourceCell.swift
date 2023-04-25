//
//  SourceCell.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/7/23.
//

import SwiftUI

struct SourceCell: View {
    
    @EnvironmentObject private var vm: ViewModel

    private let value: Int
    private var width: CGFloat { (UIScreen.main.bounds.width - 20) / 11 }
    
    init(value: Int) {
        self.value = value
    }
    
    var body: some View {
        Text("\(value)")
            .frame(width: width, height: width)
            .font(.system(size: 24))
            .background(vm.usedUpSource[value] >= 9 ? Color.lightRed : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 1)
            )
            .onTapGesture {
                vm.tapSource(value)
            }
    }
    
}

// MARK: - previews

struct SourceCell_Previews: PreviewProvider {
    static var previews: some View {
        SourceCell(value: 0)
    }
}
