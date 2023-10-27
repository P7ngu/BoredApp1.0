//
//  AchievementModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftUI


class Achievement: Identifiable{
    var id: UUID = UUID()
    var name: String;
    var content: String;
    
    var completitionStatus: Double = 0; //from 0 to 1
    var completitionMaxPoints: Double;
    var completitionPoints: Double = 0.0;
    var imageName: String = "noimage";
    
    init(id: UUID, name: String, content: String, completitionStatus: Double, completitionMaxPoints: Double, completitionPoints: Double, imageName: String) {
        self.id = id
        self.name = name
        self.content = content
        self.completitionStatus = completitionStatus
        self.completitionMaxPoints = completitionMaxPoints
        self.completitionPoints = completitionPoints
        self.imageName = imageName
    }
    
}

