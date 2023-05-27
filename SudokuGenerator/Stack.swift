//
//  Stack.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 4/21/23.
//

class Stack {
    
    private var done = [Play]()
    private var undone = [Play]()
    
    var canUndo: Bool { done.count > 0 }
    var canRedo: Bool { undone.count > 0 }

    func push(_ play: Play) {
        done.insert(play, at: 0)
        undone = [Play]()
    }
    
    func undo() -> Play? {
        if done.count > 0 {
            let play = done.remove(at: 0)
            undone.insert(play, at: 0)
            return play
        } else {
            return nil
        }
    }
    
    func redo() -> Play? {
        if undone.count > 0 {
            let play = undone.remove(at: 0)
            done.insert(play, at: 0)
            return play
        } else {
            return nil
        }
    }
    
    func reset() {
        done = [Play]()
        undone = [Play]()
    }

    func dump(_ title: String = "") {
        print("* * *  Stack.dump() \(title)")
        print("* * *    done stack")
        for play in done {
            play.dump()
        }
        print("* * *    undone stack")
        for play in undone {
            play.dump()
        }
        print("")
    }
    
}
