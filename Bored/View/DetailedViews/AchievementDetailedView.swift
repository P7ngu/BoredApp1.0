//
//  AchievementDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementDetailedView: View {
    var viewmodel = AchievementsViewModel()
    
    var achievement = Achievement(name: "Test achievement", content: "Test content", completed: false, completitionStatus: 0.8, completitionMaxPoints: 23.0)
    
    var body: some View {
        NavigationView{
        
            ZStack{ //to change the background color
                // .blue.ignoresSafeArea().opacity(0.5)
               // Color.yellow.ignoresSafeArea().opacity(0.5)
                
                
                VStack{
                    Image(achievement.imageName).resizable().aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
        
                    Text(achievement.content)
                        .font(.callout).padding()
                    ProgressView(value: achievement.completitionStatus).padding(50)
                }
            }
        }.navigationTitle(achievement.name)
    }
}

#Preview {
    AchievementDetailedView()
}
