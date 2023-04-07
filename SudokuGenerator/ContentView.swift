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
    
    init() {
        board = Board()
//        board.dump()
    }
    
    var body: some View {
        VStack {
            board
            Button {
                vm.shuffle()
            } label: {
                Text("Shuffle")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
            }
            .padding()
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
