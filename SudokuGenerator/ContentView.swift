//
//  ContentView.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        
        VStack {
            vm.board
            Button {
                vm.shuffle()
            } label: {
                HStack {
                    Text("Shuffle")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                    Spacer()
                }
                .padding()
            }

            Spacer()
        }
        .padding(.top)
    }
    
}

// MARK: - previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.shared)
    }
}
