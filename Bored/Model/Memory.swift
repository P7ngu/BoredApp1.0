//
//  Memory.swift
//  Bored
//
//  Created by Matteo Perotta on 26/10/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model

class Memory{
    var name: String;
    var content: String;
    var notes: String
    var imageName: String
    
    init(name: String, content: String, notes: String, imageName: String) {
        //we should initialize with blank values since those data are supposed to be fetched
        self.name = name
        self.content = content
        self.notes = notes
        self.imageName = imageName
    }
}
