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
    
    func get() -> Play? {
        done.first
    }
    
    func put(_ play: Play) {
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
    
    func dump() {
        print("* * *  ")
        print("* * *  Stack.dump()")
        print("* * *    done")
        for play in done {
            print("* * *      \(play.row),\(play.col),\(play.oldValue),\(play.newValue)")
        }
        print("* * *    undone")
        for play in undone {
            print("* * *      \(play.row),\(play.col),\(play.oldValue),\(play.newValue)")
        }
    }
    
}
