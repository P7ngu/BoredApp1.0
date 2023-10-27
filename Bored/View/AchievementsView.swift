//
//  AchievementsView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct AchievementsView: View {
    var viewmodel = AchievementsViewModel()
    @State var challviewmodel: ChallengeViewModel
    var achievements: [Achievement]
    
    init(cvm: ChallengeViewModel){
        let challviewmodel = cvm
        _challviewmodel = State(initialValue: challviewmodel)
        achievements = viewmodel.checkAchievementCompletitionRate(challviewmodel: challviewmodel)
    }
   
    
    var body: some View {
        
        NavigationStack{
            List {
                
                ForEach(achievements){ achievement in
                    
                    NavigationLink{
                        AchievementDetailedView(achievement: achievement)
                        
                    } label: {
                        HStack{
                            
                            Image(achievement.imageName)
                                .resizable()
                                .frame(width: 50, height: 60)
                                .imageScale(.small)
                                .foregroundStyle(.blue)
                                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                            
                            VStack{
                                HStack {
                                    //opposite to VStack, there is also ZStack
                                    
                                    Text (achievement.name).bold()
                                        .scaledToFill()
                                    
                                }//.padding()
                                ProgressView(value: achievement.completitionStatus).padding()
                            }
                        }
                    }
                    //.padding()
                }
            }.navigationTitle("Achievements")
        }
    }
}

/*#Preview {
 AchievementsView()
 }
 */
