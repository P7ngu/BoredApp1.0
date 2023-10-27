//
//  MemoryViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation
import SwiftData

class MemoryViewModel {
    init(challenges: [Challenge]){
        for challenge in challenges{
            if(challenge.completed){
                numberOfMemories += 1
            }
        }
    }
    
    
    var challenges: [Challenge] = []
    var completedChallenges: [Challenge] = []
    var numberOfMemories: Double = 0.0
    
    func getCompletedMemory() -> Double{
        return numberOfMemories
    }
    
    func convertChallengeIntoMemory (challenge: Challenge, context: ModelContext, notes: String) -> Void {
        if (challenge.completed == false){
            var newCreatedMemory: Memory = Memory(name: challenge.name, content: challenge.content, notes: notes , imageName: challenge.imageName)
            context.insert(newCreatedMemory)
            self.numberOfMemories += 1
            print("Just inserted a new memory")
            challenge.completed = true
        }
        else
        {
            numberOfMemories = numberOfMemories + 1.0
        }
    }
    
    func getChallenges(challviewmodel: ChallengeViewModel)-> [Challenge]{
        challenges = challviewmodel.challenges
        return challenges
        
    }
    
    func checkCompletedChallenges(context: ModelContext, challviewmodel: ChallengeViewModel) -> [Challenge] {
        challenges = getChallenges(challviewmodel: challviewmodel)
        print("Checking completed challenges..")
        for challenge in challenges {
            if challenge.completed {
                MemoryViewModel(challenges: challenges).convertChallengeIntoMemory(challenge: challenge, context: context, notes: "No notes")
                completedChallenges.append(challenge)
                print("Found a completed challenge...")
            } else { 
            }
        }
        
        return completedChallenges
    }
    
}

