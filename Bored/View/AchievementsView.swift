//
//  AchievementsView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementsView: View {
    var viewmodel = AchievementsViewModel()
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(viewmodel.achievements){ achievement in
                    
                    NavigationLink{
                        AchievementDetailedView(achievement: achievement)
                        
                    } label: {
                        HStack {
                            //opposite to VStack, there is also ZStack
                            Image(systemName: "puzzlepiece.extension.fill")
                                .imageScale(.large)
                                .foregroundStyle(.blue);
                            Text (achievement.name).bold()
                            
                        }.padding()
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