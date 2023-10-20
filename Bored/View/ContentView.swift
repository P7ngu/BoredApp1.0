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
                                Text(viewmodel.challenges[daycounter].name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.red)
                                
                                Image(viewmodel.challenges[daycounter].imageName)
                                    .resizable()
                                    .dynamicTypeSize(.medium)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Rectangle())
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .opacity(0.5)
                                    .padding(10)
                                Text(viewmodel.challenges[daycounter].content).padding()
                                
                                Picker(selection: .constant(1), label: Text("Challenge")) {
                                    Text("Challenge not accepted").tag(1)
                                    Text("Challenge accepted!").tag(2)
                                }
                                
                                
                               /*
                                NavigationLink{
                                    ChallengeDetailedView(challenge: viewmodel.challenges[daycounter])
                                }label: {
                                    Button("Show Details"){
                                        
                                        
                                    }
                                }
                                 */
                                
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
