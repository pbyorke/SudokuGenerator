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
            }
        }
        Spacer()
    }
    
    // MARK: - shuffle
    
    private var shuffle: some View {
        VStack {
            VStack {
                StyledText("Shuffle Page")
                    .foregroundColor(.teal)
            }
            .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(color: Color.teal.opacity(0.2), radius: 2, x: -2, y: 2)
                    .frame(height: 80)
                VStack {
                    Text("The first step is to shuffle the numbers")
                        .multilineTextAlignment(.center)
                    Text("You can do this as many times as you want")
                    Button("Shuffle") {vm.shuffle()}
                }
            }
            .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(color: Color.teal.opacity(0.2), radius: 2, x: -2, y: 2)
                    .frame(height: 60)
                VStack {
                    Text("When you are done shuffling, go to the")
                        .multilineTextAlignment(.center)
                    Button("Exclusion page") {vm.step = .exclude}
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - exclude
    
    private var exclude: some View {
        VStack {
            VStack {
                StyledText("Exclusion Page")
                    .foregroundColor(.teal)
            }
            .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(color: Color.teal.opacity(0.2), radius: 2, x: -2, y: 2)
                    .frame(height: 80)
                VStack {
                    Text("You can make your puzzle as hard as you want")
                        .multilineTextAlignment(.center)
                    Button("Exclude 10 numbers") {vm.exclude10()}
                    Button("Exclude 1 number") {vm.exclude1()}
                }
            }
            .padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .shadow(color: Color.teal.opacity(0.2), radius: 2, x: -2, y: 2)
                    .frame(height: 80)
                VStack {
                    Text("When done")
                        .multilineTextAlignment(.center)
                    Button("Lock board and play") {
                        vm.step = .play
                        vm.lock()
                    }
                    .disabled(!vm.atLeastOneExclusion)
                    Button("Go back") {vm.step = .shuffle}
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - playing
    
    private var play: some View {
        VStack {
            HStack {
                Button("undo") {vm.undo()}
                Button("redo") {vm.redo()}
            }
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            )
            VStack {
                Text("When you are done, restart")
                Button("Restart") {showAlert = true}
            }
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
            )
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
