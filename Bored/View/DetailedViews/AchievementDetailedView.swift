//
//  AchievementDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementDetailedView: View {
    var viewmodel = AchievementsViewModel()
    var compPointString: String = ""
    var maxPointString: String = ""
    
    var achievement = Achievement(id: UUID(), name: "Test achievement", content: "Test content", completitionStatus: 0.8, completitionMaxPoints: 23.0, completitionPoints: 1.0, imageName: "trofeo")
    
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
                    
                    if (achievement.completitionPoints <= achievement.completitionMaxPoints){ //not completed yet
                        var compPointString: String = String (achievement.completitionPoints)
                        var maxPointString = String(achievement.completitionMaxPoints)
                        Text("Points: " + compPointString + " / " + maxPointString)
                            .font(.caption).padding()
                    }
                    else{
                        var compPointString: String = String (achievement.completitionMaxPoints)
                        var maxPointString: String = String(achievement.completitionMaxPoints)
                        Text("Points: " + compPointString + " / " + maxPointString)
                            .font(.caption).padding()
                    }
                    
                   
                    
                    ProgressView(value: achievement.completitionStatus).padding(50)
                    
                   
                }
            }
        }.navigationTitle(achievement.name)
    }
}

#Preview {
    AchievementDetailedView()
}
