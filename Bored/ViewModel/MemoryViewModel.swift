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
    
    func getTodaysCompletedMemory() -> Void {
        
    }
    
    func convertChallengeIntoMemory (challenge: Challenge, context: ModelContext, notes: String) -> Void {
        if (challenge.completed == false){
            var newCreatedMemory: Memory = Memory(name: challenge.name, content: challenge.content, notes: notes , imageName: challenge.imageName)
            context.insert(newCreatedMemory)
            challenge.completed=true
        }
        else
        {
            
        }
    }
    
    func getChallenges()-> [Challenge]{
        var challviewmodel = ChallengeViewModel()
        challenges = challviewmodel.challenges
        return challenges
        
    }
    
    func checkCompletedChallenges(context: ModelContext) -> [Challenge] {
        challenges = getChallenges()
        print("Checking completed challenges..")
        for challenge in challenges {
            if challenge.completed {
                MemoryViewModel().convertChallengeIntoMemory(challenge: challenge, context: context, notes: "No notes")
                completedChallenges.append(challenge)
                print("Found a completed challenge...")
            } else { 
            }
        }
        
        return completedChallenges
    }
    
}

