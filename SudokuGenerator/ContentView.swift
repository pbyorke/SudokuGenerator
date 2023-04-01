//
//  ContentView.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 3/30/23.
//

import SwiftUI

struct Cell: Identifiable {
    
    var id = UUID()
    var value = 0
    
    init(_ value: Int) {
        self.value = value
    }
    
    var cell: some View {
        Text("\(value)")
            .font(.title3)
            .padding(10)
            .border(.black)
    }
    
    mutating func reset(_ value: Int) {
        self.value = value
    }
    
}

struct Row: Identifiable {
    
    var id = UUID()
    var cells: [Cell]
    
    init(_ cells: [Cell]) {
        self.cells = cells
    }
    
    var row: some View {
        HStack {
            ForEach(cells) {
                $0.cell
            }
        }
    }
    
    subscript(_ cell: Int) -> Cell {
        cells[cell]
    }

    mutating func reset(_ c: Int, _ v: Int) {
        var cell = cells[c]
        cell.reset(v)
    }
    
}

struct World: Identifiable {
    
    var id = UUID()
    var rows: [Row]
    
    init(_ rows: [Row]) {
        self.rows = rows
    }
    
    subscript(_ row: Int) -> Row {
        rows[row]
    }
    
    mutating func reset(_ r: Int, _ c: Int, _ v: Int) {
        var row = rows[r]
        row.reset(c, v)
    }
    
}

class ViewModel: ObservableObject {
    
    @Published var world = World([
            Row([Cell(1),Cell(2),Cell(3), Cell(4),Cell(5),Cell(6), Cell(7),Cell(8),Cell(9)]),
            Row([Cell(4),Cell(5),Cell(6), Cell(7),Cell(8),Cell(9), Cell(1),Cell(2),Cell(3)]),
            Row([Cell(7),Cell(8),Cell(9), Cell(1),Cell(2),Cell(3), Cell(4),Cell(5),Cell(6)]),
            Row([Cell(2),Cell(3),Cell(1), Cell(5),Cell(6),Cell(4), Cell(8),Cell(9),Cell(7)]),
            Row([Cell(5),Cell(6),Cell(4), Cell(8),Cell(9),Cell(7), Cell(2),Cell(3),Cell(1)]),
            Row([Cell(8),Cell(9),Cell(7), Cell(2),Cell(3),Cell(1), Cell(5),Cell(6),Cell(4)]),
            Row([Cell(3),Cell(1),Cell(2), Cell(6),Cell(4),Cell(5), Cell(9),Cell(7),Cell(8)]),
            Row([Cell(6),Cell(4),Cell(5), Cell(9),Cell(7),Cell(8), Cell(3),Cell(1),Cell(2)]),
            Row([Cell(9),Cell(7),Cell(8), Cell(3),Cell(1),Cell(2), Cell(6),Cell(4),Cell(5)]),
        ])
    var count = 0
    
    init() {
        world.reset(0, 0, 0)
        print("* * *  \(world)")
    }
    
    func increment() {
        count += 1
    }
    
}

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        VStack {
            VStack {
                ForEach(vm.world.rows) {
                    $0.row
                }
                Spacer()
            }
        }
        .padding(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
