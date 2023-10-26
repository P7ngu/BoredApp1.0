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
       
        Achievement(name: "First goaaaal! 🥅", content: "Complete your first challenge",
                    completitionMaxPoints: 1.0, completitionPoints: 2.0, imageName: "trofeo2"),
        Achievement(name: "Dante's Paradiso 🔥", content: "Complete 3 challenges",
                    completitionMaxPoints: 3.0, completitionPoints: 2.0, imageName: "trofeo4"),
        Achievement (name: "First week run 🏃", content: "Complete 7 challenges",
                     completitionMaxPoints: 7.0, completitionPoints: 2.0, imageName: "trofeo3"),
        Achievement(name: "Birdwatcher 🍃", content: "Complete all the nature-related challenges",
                    completitionMaxPoints: 10.0, completitionPoints: 2.0, imageName: "trofeo6"),
        Achievement (name: "Half of the road 😇", content: "Complete 15 challenges",
                     completitionMaxPoints: 15.0, completitionPoints: 2.0, imageName: "trofeo5"),
        Achievement (name: "DaVinci award 🎨", content: "Complete all art-related challenges",
                     completitionMaxPoints: 20.0, completitionPoints: 2.0, imageName: "trofeo7"),
        Achievement(name: "The best in the game 🏆", content: "Complete all the challenges",
                    completitionMaxPoints: 31.0, completitionPoints: 2.0, imageName: "trofeo1"),
    ]

    func getAchievements() -> [Achievement]{
        return self.achievements;
    }
    
    func getNumberOfCompletedChallenges() -> Double{
        var tempNumOfChallenges = 0.0
        completedChallenges = ChallengeViewModel().challenges
        for challenge in completedChallenges{
            if(challenge.completed ){
                tempNumOfChallenges += 1.0;
            } else{
                
            }
        }
        return tempNumOfChallenges
    }
    
    func checkAchievementCompletitionRate() -> [Achievement] {
        //check completed challenges, then update the achievements
        var numOfCompletedChallenges = getNumberOfCompletedChallenges()
        
        achievements = getAchievements()
        
        for achievement in achievements {
            var updatedCompletitionStatus = ((numOfCompletedChallenges) / (achievement.completitionMaxPoints))
            
            //print(updatedCompletitionStatus)
            
            var updatedAchievement = Achievement(name: achievement.name, content: achievement.content, completitionStatus: updatedCompletitionStatus, completitionMaxPoints: achievement.completitionMaxPoints, completitionPoints: numOfCompletedChallenges, imageName: achievement.imageName)
            
          
            
            updatedAchievements.append(updatedAchievement)
            
        }
        
        self.achievements = updatedAchievements;
       return updatedAchievements
    }
    
    
    
}
