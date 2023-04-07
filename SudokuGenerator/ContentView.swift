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
    }
    
    var body: some View {
        VStack {
            board
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(lineWidth: 1)
                )
            HStack {
                Button {
                    vm.shuffle()
                } label: {
                    Text("Shuffle")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                }
                .padding()
                Button {
                    vm.exclude10()
                } label: {
                    Text("Exclude 10")
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                }
                .padding()
                Spacer()
            }
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
