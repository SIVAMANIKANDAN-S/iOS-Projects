//
//  Extension.swift
//  iOTT
//
//  Created by zs-mac-3 on 28/11/22.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
