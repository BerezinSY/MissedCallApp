//
//  String.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 21.03.2021.
//

import Foundation

extension String {
    
    mutating func trim(before character: Character) {
        guard let index = firstIndex(of: character) else { return }
        removeSubrange(startIndex...index)
    }
    
    mutating func trim(after character: Character) {
        guard let index = lastIndex(of: character) else { return }
        removeSubrange(index..<endIndex)
    }
}
