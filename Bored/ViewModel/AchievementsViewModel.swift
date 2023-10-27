//
//  AchievementsViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftUI

class AchievementsViewModel{
    
    var updatedAchievements: [Achievement] = []
    var completedChallenges: [Challenge] = []
    var numberOfCompletedChallenges: Int = 0
    
    var achievements: [Achievement] = [
       
        Achievement(id: UUID(), name: "First goaaaal! 🥅", content: "Complete your first challenge", completitionStatus: 0.3,
                    completitionMaxPoints: 1.0, completitionPoints: 2.0, imageName: "trofeo2"),
        Achievement(id: UUID(), name: "Dante's Paradiso 🔥", content: "Complete 3 challenges", completitionStatus: 0.3,
                    completitionMaxPoints: 3.0, completitionPoints: 2.0, imageName: "trofeo4"),
        Achievement (id: UUID(), name: "First week run 🏃", content: "Complete 7 challenges", completitionStatus: 0.3,
                     completitionMaxPoints: 7.0, completitionPoints: 2.0, imageName: "trofeo3"),
        Achievement(id: UUID(), name: "Birdwatcher 🍃", content: "Complete all the nature-related challenges", completitionStatus: 0.3,
                    completitionMaxPoints: 10.0, completitionPoints: 2.0, imageName: "trofeo6"),
        Achievement (id: UUID(), name: "Half of the road 😇", content: "Complete 15 challenges", completitionStatus: 0.3,
                     completitionMaxPoints: 15.0, completitionPoints: 2.0, imageName: "trofeo5"),
        Achievement (id: UUID(), name: "DaVinci award 🎨", content: "Complete all art-related challenges", completitionStatus: 0.3,
                     completitionMaxPoints: 20.0, completitionPoints: 2.0, imageName: "trofeo7"),
        Achievement(id: UUID(), name: "The best in the game 🏆", content: "Complete all the challenges", completitionStatus: 0.3,
                    completitionMaxPoints: 31.0, completitionPoints: 2.0, imageName: "trofeo1"),
    ]

    func getAchievements() -> [Achievement]{
        return self.achievements;
    }
    
    func getNumberOfCompletedChallenges(challviewmodel: ChallengeViewModel) -> Double{
        print("the number of completed challenges is")
        print(challviewmodel.completedChallengeCounter)
        return challviewmodel.completedChallengeCounter
    }
    
    func checkAchievementCompletitionRate(challviewmodel: ChallengeViewModel) -> [Achievement] {
        //check completed challenges, then update the achievements
        var numOfCompletedChallenges = getNumberOfCompletedChallenges(challviewmodel: challviewmodel)
        
        achievements = getAchievements()
        
        for achievement in achievements {
            var updatedCompletitionStatus = ((numOfCompletedChallenges) / (achievement.completitionMaxPoints))
            print("The number of completed challenge is: ")
            print(numOfCompletedChallenges)
            
            var updatedAchievement = Achievement(id: UUID(), name: achievement.name, content: achievement.content, completitionStatus: updatedCompletitionStatus, completitionMaxPoints: achievement.completitionMaxPoints, completitionPoints: numOfCompletedChallenges, imageName: achievement.imageName)
            
            achievement.completitionStatus = updatedCompletitionStatus
            
            updatedAchievements.append(updatedAchievement)
            
        }
        
        self.achievements = updatedAchievements;
       return updatedAchievements
    }
    
    
    
}
