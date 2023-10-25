//
//  MemoryViewModel.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import Foundation

class MemoryViewModel {
    
    var challenges: [Challenge] = []
    var completedChallenges: [Challenge] = []
    
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

