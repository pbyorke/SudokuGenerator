//
//  URButton.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/26/23.
//

import SwiftUI


enum URType {
    case undo
    case redo
}

struct URButton: View {
    
    @EnvironmentObject private var vm: ViewModel
    @State var type: URType
    
    init(_ type: URType) {
        self.type = type
    }
    
    var body: some View {
        Button {
            switch type {
            case .undo: vm.undo()
            case .redo: vm.redo()
            }
        } label: {
            Text(type == .undo ? "undo" : "redo")
                .font(UIDevice.isIPad ? .title : .title3)
        }
        .disabled( type == .undo ? !vm.canUndo : !vm.canRedo )
    }
    
}
