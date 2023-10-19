//
//  ContentView.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

//This is the Today challenges

import SwiftUI

struct ContentView: View {
    var viewmodel = ChallengeViewModel();
    var daycounter = 0;
    
    var body: some View {
        TabView{
            NavigationStack{
                ScrollView{
                    VStack {
                        ZStack{
                            VStack{
                                Image(viewmodel.challenges[daycounter].imageName)
                                    .resizable()
                                    .dynamicTypeSize(.medium)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Rectangle())
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .opacity(0.5)
                                    .padding(10)
                                
                                Button("Show Details"){
                                    
                                }
                                
                            }
                            
                        }
                    }
                    .padding()
                }.navigationTitle("Today's Challenge is:")
            }
            .tabItem {
                Label("Today", systemImage: "cloud.sun")
            }
            MemoriesView()
                .tabItem{
                    Label ("Memories", systemImage: "memories")
                }
            AchievementsView()
                .tabItem{
                    Label("Achievements", systemImage: "trophy.fill")
                }
        } //end of tabview
    }
}

#Preview {
    ContentView()
}
