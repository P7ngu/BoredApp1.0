//
//  ChallengeModel.swift
//  Bored
//
//  Created by Matteo Perotta on 18/10/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Challenge: Identifiable{
    var id: UUID = UUID()
    var name: String;
    var content: String;
    var completed: Bool = false; //if it has been completed then it is also a memory
    var imageName: String = "noimage";
    var assignedDate: String = Time().getCurrentDate()
    
    init(id: UUID, name: String, content: String, completed: Bool, imageName: String, assignedDate: String) {
        self.id = id
        self.name = name
        self.content = content
        self.completed = completed
        self.imageName = imageName
        self.assignedDate = assignedDate
    }
    
    func markChallengeAsCompleted(challengeToMark: Challenge) ->Void{
        challengeToMark.completed = true;
    }
    
}
    
