//
//  StyledText.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/4/23.
//

import SwiftUI

struct StyledText: View {
    
    private var title = ""
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
    }
    
}

// MARK: - previews

struct StyledText_Previews: PreviewProvider {
    static var previews: some View {
        StyledText("This is a test")
    }
}
