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
    
    @State private var isShowingReach   = false
    @State private var isShowingErrors  = false
    @State private var showAlert        = false
    
    init() {
        board = Board()
        source = Source()
    }
    
    // MARK: - body
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                StyledText("Sudoku Generator")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom)
            .alert("Restart?", isPresented: $showAlert) {
                Button {
                    vm.reset()
                    vm.step = .shuffle
                } label: {
                    Text("YES")
                }
                Button {
                    showAlert = false
                } label: {
                    Text("NO")
                }
            }
            board
                .padding(.bottom)
            if vm.isRunning {
                source
                    .padding(.bottom)
            }
            switch vm.step {
            case .shuffle:  shuffle
            case .exclude:  exclude
            case .play:     play
            case .playing:  playing
            }
        }
        Spacer()
    }
    
    // MARK: - shuffle
    
    private var shuffle: some View {
        VStack {
            HStack {
                Spacer()
                StyledText("Shuffle the numbers")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.shuffle()
                } label: {
                    StyledText("Shuffle all the numbers")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.step = .exclude
                } label: {
                    StyledText("Exclude Page →")
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - exclude
    
    private var exclude: some View {
        VStack {
            HStack {
                Spacer()
                StyledText("Exclude some numbers")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.exclude10()
                } label: {
                    StyledText("Exclude 10 numbers")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.exclude1()
                } label: {
                    StyledText("Exclude 1 number")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.step = .play
                } label: {
                    StyledText("Play Page →")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.step = .shuffle
                } label: {
                    StyledText("Shuffle Page ←")
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK - play
    
    private var play: some View {
        VStack {
            HStack {
                Spacer()
                StyledText("Start Playing")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.lock()
                    vm.step = .playing
                } label: {
                    StyledText("Start Play")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    vm.step = .exclude
                } label: {
                    StyledText("Exclude Page ←")
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - playing
    
    private var playing: some View {
        VStack {
            HStack {
                Button {
                    vm.undo()
                } label: {
                    StyledText("Undo")
                }
                .padding(.trailing, 5)
                Button {
                    vm.redo()
                } label: {
                    StyledText("Redo")
                }
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Spacer()
                StyledText("Start another game")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
            HStack {
                Button {
                    showAlert = true
                } label: {
                    StyledText("Restart")
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
}

// MARK: - previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.shared)
    }
}
