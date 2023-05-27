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
                    Button {
                        vm.reset()
                        vm.step = .shuffle
                    } label: {
                        VarText("YES")
                    }
                    Button {
                        showAlert = false
                    } label: {
                        VarText("NO")
                    }
                }
            board
                .padding(.bottom)
            if vm.showSource {
                source
                    .padding(.bottom)
            }
            switch vm.step {
            case .shuffle:  shuffle
            case .exclude:  exclude
            case .play:     play
            case .recap:    recap
            case .error:    error
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
    
    // MARK: - shuffle
    
    private var shuffle: some View {
        VStack {
            VStack {
                Button {
                    vm.shuffle()
                } label: {
                    VarText("Shuffle")
                }
                VarText("the clues as many times as you want")
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("When you are done, go to the")
                Button {
                    vm.step = .exclude
                } label: {
                    VarText("Exclusion page")
                }
                
            }
            .padding(.horizontal)
        }
    }

    // MARK: - exclude
    
    private var exclude: some View {
        VStack {
                VStack {
                    VarText("You can make your puzzle as hard as you want")
                    Button {
                        vm.exclude10()
                    } label: {
                        VarText("Exclude 10 numbers")
                    }
                    Button {
                        vm.exclude1()
                    } label: {
                        VarText("Exclude 1 number")
                    }
                    HStack {
                        URButton(.undo)
                        URButton(.redo)
                    }
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("When done")
                Button {
                    vm.step = .play
                    vm.lock()
                } label: {
                    VarText("Lock board and play")
                }
                .disabled(!vm.atLeastOneExclusion)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
            VStack {
                VarText("OR")
                Button {
                    vm.step = .shuffle
                } label: {
                    VarText("Go back")
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - play
    
    private var play: some View {
        VStack {
            HStack {
                URButton(.undo)
                URButton(.redo)
            }
            .padding(8)
            VStack {
                VarText("When you are done, restart")
                Button {
                    showAlert = true
                } label: {
                    VarText("Restart")
                }
            }
            .padding(8)
        }
    }
    
    // MARK: - recap
    
    private var error: some View {
        VStack {
            HStack {
                URButton(.undo)
                URButton(.redo)
            }
            .padding(8)
        }
    }
    
    // MARK: - recap
    
    private var recap: some View {
        VStack {
            VStack {
                VarText("When you are done, restart")
                Button {
                    showAlert = true
                } label: {
                    VarText("Restart")
                }

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
