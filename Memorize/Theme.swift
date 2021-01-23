//
//  Theme.swift
//  Memorize
//
//  Created by Zubair Ahmed on 23/01/2021.
//

import SwiftUI

struct Theme: Codable, Identifiable {
    var id: UUID
    let numberOfPairs: Int
    let emojis: [String]
    let name: String
    let color: UIColor.RGB
}
