//
//  UIDeviceExtension.swift
//  SudokuGenerator
//
//  Created by Peter Yorke on 5/26/23.
//

import UIKit

extension UIDevice {
    
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
}
