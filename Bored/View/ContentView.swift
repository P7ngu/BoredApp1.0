//
//  ContentView.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

//This is the Today challenges

import SwiftUI

struct ContentView: View {
    
    @State var showSettings: Bool = false
    var viewmodel = ChallengeViewModel();
    var daycounter = 0;
    var currentChallenge = ChallengeViewModel().getTodaysChallenge()
    //var currentDate = Time().getCurrentDate()
    
    
    
    @State var isPickerShowing = false
    
    @State var selectedImage: UIImage = UIImage()
    
    @State var selection: String = "Unaccepted"
    let filterOptions: [String] = ["Unaccepted", "Accepted"]
    
    
    var body: some View {
        TabView{
            NavigationStack{
                ScrollView{
                    VStack {
                        ZStack{
                            VStack{
                                Text(currentChallenge.name).bold().font(.title)
                                    .foregroundStyle(.red)
                                    NavigationLink(destination: ChallengeDetailedView(challenge: currentChallenge)){
                                        VStack{
                                            Image(currentChallenge.imageName)
                                                .resizable()
                                                .dynamicTypeSize(.medium)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Rectangle())
                                                .shadow(radius: 10)
                                                .opacity(0.5)
                                                .padding(10)
                                                .frame(width: 300, height: 300)
                                            Text("For this challenge you need to...").font(.title2).foregroundStyle(.black)
                                            HStack{
                                        
                                                Text("show details").font(.title2)
                                                Image(systemName: "info.bubble")
                                            }
                                        }
                                    
                                    
                                }
                                
                                
                            }
                            
                        }
                        
                    }
                    .padding()
                }
                .navigationTitle("Today")
                

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


