//
//  PlayStep.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/20/23.
//

import Foundation

enum PlayStep {
    case shuffle
    case exclude
    case play
    case recap
    case error
    
    var name: String {
        switch self {
        case .shuffle:  return "shuffle"
        case .exclude:  return "exclude"
        case .play:     return "play"
        case .recap:    return "recap"
        case .error:    return "error"
        }
    }
}
