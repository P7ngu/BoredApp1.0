//
//  AchievementsView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementsView: View {
    var viewmodel = AchievementsViewModel()
    var achievements = AchievementsViewModel().checkAchievementCompletitionRate()
    
    var body: some View {
        
        NavigationStack{
            List {
                
                ForEach(achievements){ achievement in
                    
                    NavigationLink{
                        AchievementDetailedView(achievement: achievement)
                        
                    } label: {
                        HStack {
                            //opposite to VStack, there is also ZStack
                            Image(systemName: "flag.checkered.2.crossed")
                                .imageScale(.large)
                                .foregroundStyle(.blue);
                            Text (achievement.name).bold()
                                .scaledToFill()
                            
                        }.padding()
                        ProgressView(value: achievement.completitionStatus)
                    }
                    //.padding()
                }
            }.navigationTitle("Achievements")
        }
    }
}

#Preview {
    AchievementsView()
}
