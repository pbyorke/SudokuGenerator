//
//  Action.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/26/23.
//

import SwiftUI

struct Action: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    private var title: String
    private var action: ()->Void
    
    init(_ title: String, _ action: @escaping ()->Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VarText(title)
        }
    }
    
}

// MARK: - previews

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Action("Test") { print("Hi") }
    }
}
