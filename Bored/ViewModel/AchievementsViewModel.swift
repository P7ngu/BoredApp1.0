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
        Achievement(name: "First goaaaal!", content: "Complete your first challenge",
                    completitionMaxPoints: 1.0, completitionPoints: 2.0),
        Achievement(name: "Dante's Paradiso", content: "Complete 3 challenges",
                    completitionMaxPoints: 3.0, completitionPoints: 2.0),
        Achievement (name: "5some", content: "Complete 5 challenges",
                     completitionMaxPoints: 5.0, completitionPoints: 2.0),
        Achievement (name: "CONGRA7S!", content: "Complete 7 challenges",
                     completitionMaxPoints: 7.0, completitionPoints: 2.0),
        Achievement(name: "The best in the game", content: "Complete all the challenges",
                    completitionMaxPoints: 31.0, completitionPoints: 2.0)
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
            
            print(updatedCompletitionStatus)
            
            var updatedAchievement = Achievement(name: achievement.name, content: achievement.content, completitionStatus: updatedCompletitionStatus, completitionMaxPoints: achievement.completitionMaxPoints, completitionPoints: numOfCompletedChallenges)
            
          
            
            updatedAchievements.append(updatedAchievement)
            
        }
        
        self.achievements = updatedAchievements;
       return updatedAchievements
    }
    
    
    
}
