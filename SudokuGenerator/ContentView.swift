//
//  ContentView.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var vm: ViewModel

    var board: Board
    var source: Source
    
    @State private var showAlert = false
    
    init() {
        board = Board()
        source = Source()
    }
    
    // MARK: - body
    
    var body: some View {
        VStack {
            StyledText(title)
                .foregroundColor(.gray)
                .padding(.bottom)
                .alert("Restart?", isPresented: $showAlert) {
                    Action("YES") {
                        vm.reset()
                        vm.step = .shuffle
                    }
                    Action("NO") { showAlert = false }
                }
            board
                .padding(.bottom)
            if vm.showSource {
                source
                    .padding(.bottom)
            }
            switch vm.step {
            case .shuffle:  shufflePage
            case .exclude:  excludePage
            case .play:     playPage
            case .recap:    recapPage
            case .error:    errorPage
            }
        }
        Spacer()
    }
    
    private func restart() {
        vm.reset()
        vm.step = .shuffle
    }
    
    private var title: String {
        return "Sudoku Generator"
//        if vm.selectedRow == -3 {
//            return "Sudoku (\(vm.step.name))"
//        } else {
//            return "Sudoku (\(vm.step.name)-\(vm.selectedRow),\(vm.selectedCol))"
//        }
    }
    
    // MARK: - shufflePage
    
    private var shufflePage: some View {
        VStack {
            VStack {
                Action("Shuffle") { vm.shuffle() }
                VarText("the clues as many times as you want")
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("When you are done, go to the")
                Action("Exclusion page") { vm.step = .exclude }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - excludePage
    
    private var excludePage: some View {
        VStack {
                VStack {
                    VarText("You can make your puzzle as hard as you want")
                    Action("Exclude 10 numbers") { vm.exclude10() }
                    Action("Exclude 1 number") { vm.exclude1() }
                    HStack {
                        URButton(.undo)
                        URButton(.redo)
                    }
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("When done")
                Action("Lock board and play") {
                    vm.step = .play
                    vm.lock()
                }
                .disabled(!vm.atLeastOneExclusion)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("OR")
                Action("Go back") { vm.step = .shuffle }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - playPage
    
    private var playPage: some View {
        VStack {
            HStack {
                URButton(.undo)
                URButton(.redo)
            }
            .padding(8)
            VStack {
                VarText("When you are done, restart")
                Action("Restart") { showAlert = true }
            }
            .padding(8)
        }
    }
    
    // MARK: - errorPage
    
    private var errorPage: some View {
        VStack {
            HStack {
                URButton(.undo)
                URButton(.redo)
            }
            .padding(8)
        }
    }
    
    // MARK: - recapPage
    
    private var recapPage: some View {
        VStack {
            VStack {
                VarText("When you are done, restart")
                Action("Restart") { showAlert = true }
            }
            .padding(8)
        }
    }
    
}

// MARK: - previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.shared)
    }
}
