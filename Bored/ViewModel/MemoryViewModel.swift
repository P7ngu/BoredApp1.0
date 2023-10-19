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
        
    func checkMemoriesFromChallenges() -> [Challenge] {
        
        challenges=getChallenges()
        for challenge in challenges {
            
            if challenge.completed {
                completedChallenges.append(challenge)
            } else {
                
            }
            
        }
        
        return completedChallenges
    }
    
}

