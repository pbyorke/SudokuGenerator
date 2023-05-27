//
//  VarText.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/26/23.
//

import SwiftUI

struct VarText: View {
    
    private var title = ""
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(UIDevice.isIPad ? .title : .title3)
            .multilineTextAlignment(.center)
    }
    
}

// MARK: - previews

struct VarText_Previews: PreviewProvider {
    static var previews: some View {
        VarText("This is a test")
    }
}
