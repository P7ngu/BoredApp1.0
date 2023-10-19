//
//  AchievementDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementDetailedView: View {
    var viewmodel = AchievementsViewModel()
    
    var achievement = Achievement(name: "Test achievement", content: "Test content", completed: true)
    
    var body: some View {
        
        ZStack{ //to change the background color
            // .blue.ignoresSafeArea().opacity(0.5)
            
            
            VStack{
                Image(achievement.imageName).resizable().aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text(achievement.name + ": ")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text(achievement.content)
                    .font(.callout)
            }
        }
    }
}

#Preview {
    AchievementDetailedView()
}
