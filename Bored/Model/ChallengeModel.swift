//
//  ChallengeModel.swift
//  Bored
//
//  Created by Matteo Perotta on 18/10/23.
//

import Foundation
import SwiftUI


struct Challenge: Identifiable{
    var id: UUID = UUID()
    var name: String;
    var content: String;
    var color: Color = .blue;
    var completed: Bool = false; //if it has been completed then it is also a memory
    var imageName: String = "noimage";
    
}
