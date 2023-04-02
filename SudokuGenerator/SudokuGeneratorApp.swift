//
//  SudokuGeneratorApp.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 3/30/23.
//

import SwiftUI

@main
struct SudokuGeneratorApp: App {
    
    @StateObject private var vm = ViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
