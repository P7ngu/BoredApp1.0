//
//  ChallengeModel.swift
//  Bored
//
//  Created by Matteo Perotta on 18/10/23.
//

import Foundation
import SwiftUI
import SwiftData


class Challenge: Identifiable{
    var id: UUID = UUID()
    var name: String;
    var content: String;
    var color: Color = .blue;
    var completed: Bool = false; //if it has been completed then it is also a memory
    var imageName: String = "noimage";
    var assignedDate: String = Time().getCurrentDate()
    
    @Attribute(.externalStorage)
    var image: Data?
    
    init(id: UUID, name: String, content: String, color: Color, completed: Bool, imageName: String, assignedDate: String, image: Data? = nil) {
        self.id = id
        self.name = name
        self.content = content
        self.color = color
        self.completed = completed
        self.imageName = imageName
        self.assignedDate = assignedDate
        self.image = image
    }
      
}
