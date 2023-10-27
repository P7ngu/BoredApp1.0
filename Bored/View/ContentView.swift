//
//  ContentView.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

//This is the Today challenges

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var showSettings: Bool = false
    var viewmodel = ChallengeViewModel();
    var daycounter = 0;
    var currentChallenge = ChallengeViewModel().getTodaysChallenge()
    //var currentDate = Time().getCurrentDate()
    @Query var challengess: [Challenge]
    @Environment(\.modelContext) var modelContext
    
    
    
    @State var isPickerShowing = false
    
    @State var selectedImage: UIImage = UIImage()
    
    @State var selection: String = "Unaccepted"
    let filterOptions: [String] = ["Unaccepted", "Accepted"]
    
 
    
    
    var body: some View {
        TabView{
            NavigationStack{
                ScrollView{
                    ZStack{
                        //Color.yellow.ignoresSafeArea().opacity(0.3)
                    VStack {
                        ZStack{
                            
                            //Color.yellow.opacity(0.2).ignoresSafeArea()
                              //  .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading){
                                
                                Text(currentChallenge.name).bold().font(.title)
                                    .foregroundStyle(Color.orange)
                                
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
                        
                    }
                    .padding()
                }.background {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(.yellow)
                        .opacity(0.5)
                        .blur(radius: /*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
                       // .scenePadding(/*@START_MENU_TOKEN@*/.minimum/*@END_MENU_TOKEN@*/, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.orange, lineWidth: 10)
                       // .frame(height: )
                }
                .navigationTitle("Today's Challenge")
                .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            }
            
            .tabItem {
                Label("Today's Challenge", systemImage: "cloud.sun")
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
   do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Challenge.self, configurations: config)
        
        let example = Challenge(id: UUID(), name: "mkrmf", content: "diejd", completed: false, imageName: "noimafe", assignedDate: "00")
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

