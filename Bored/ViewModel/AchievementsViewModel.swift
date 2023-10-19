//
//  AchievementsViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftUI

class AchievementsViewModel{
    var achievements: [Achievement] = [
        Achievement(name: "The best in the game", content: "Complete all the challenges"),
        Achievement(name: "Dante's Paradiso", content: "Complete 3 challenges", completitionStatus: 0.2),
        Achievement(name: "First goaaaal!", content: "Complete your first challenge",
                    completitionStatus: 1.0)
       
    ]
}
