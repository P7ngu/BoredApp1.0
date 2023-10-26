//
//  MemoryViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftData

class MemoryViewModel {
    
    var challenges: [Challenge] = []
    var completedChallenges: [Challenge] = []
    
    func convertChallengeIntoMemory (challenge: Challenge, context: ModelContext, notes: String) -> Memory {
        
        var newCreatedMemory: Memory = Memory(name: challenge.name, content: challenge.content, notes: notes , imageName: challenge.imageName)
        context.insert(newCreatedMemory)
        
        return newCreatedMemory
    }
    
    func getChallenges()-> [Challenge]{
        var challviewmodel = ChallengeViewModel()
        challenges = challviewmodel.challenges
        return challenges
        
    }
    
    func checkCompletedChallenges() -> [Challenge] {
        challenges = getChallenges()
        print("Checking completed challenges..")
        for challenge in challenges {
            if challenge.completed {
                completedChallenges.append(challenge)
                print("Found a completed challenge...")
            } else {
            } 
        }
        
        return completedChallenges
    }
    
}

