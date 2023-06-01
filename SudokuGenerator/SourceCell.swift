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
    var width: CGFloat { (UIScreen.main.bounds.width - (UIDevice.isIPad ? 120 : 20)) / 9 }

    init(value: Int) {
        self.value = value
    }
    
    var body: some View {
        Text("\(value)")
            .frame(width: width, height: width)
            .font(.system(size: UIDevice.isIPad ? 50 : 27))
            .background(Color.white)
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
