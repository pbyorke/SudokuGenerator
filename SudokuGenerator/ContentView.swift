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
    
    @State private var disableShuffle = false
    @State private var disableExclude = false
    @State private var disableLock = false

    init() {
        board = Board()
        source = Source()
    }
    
    var body: some View {
        VStack {
            board
            if vm.isRunning {
                source
            }
            HStack {
                Button {
                    vm.shuffle()
                } label: {
                    Text("~")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(disableShuffle ? Color.realGrey : Color.green)
                }
                .disabled(disableShuffle)
                .padding()
                Button {
                    vm.exclude10()
                } label: {
                    Text("X 10")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(disableExclude ? Color.realGrey : Color.green)
                }
                .disabled(disableExclude)
                .padding()
                Button {
                    vm.exclude1()
                } label: {
                    Text("X 1")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(disableExclude ? Color.realGrey : Color.green)
                }
                .disabled(disableExclude)
                .padding()
                Button {
                    vm.reset()
                    disableLock = false
                    disableExclude = false
                    disableShuffle = false
                } label: {
                    Text("R")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                }
                .padding()
            }
            Button {
                vm.lock()
                disableLock = true
                disableExclude = true
                disableShuffle = true
            } label: {
                Text("Lock & Run")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .foregroundColor(.white)
                    .background(disableLock ? Color.realGrey : Color.green)
            }
            .disabled(disableLock)

            Spacer()
        }
        .padding()
    }
    
}

// MARK: - previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.shared)
    }
}
