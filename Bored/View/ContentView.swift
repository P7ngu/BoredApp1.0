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
    @State var viewmodel: ChallengeViewModel
    var currentChallenge: Challenge
    
    init(modelContext: ModelContext){
        var viewmodel = ChallengeViewModel(modelContext: modelContext)
        _viewmodel = State(initialValue: viewmodel)
        currentChallenge = viewmodel.getTodaysChallenge()
    }
    
    @State var showSettings: Bool = false
    var daycounter = 0;
    
    @Query let challengess: [Challenge]
    @Environment(\.modelContext) var modelContext
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage = UIImage()
    
    var body: some View {
        TabView{
            NavigationStack{
                ScrollView{
                    ZStack{
                        //Color.yellow.ignoresSafeArea().opacity(0.3)
                        VStack {
                            ZStack{//Color.yellow.opacity(0.2).ignoresSafeArea()
                                //  .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                VStack(alignment: .leading){
                                    NavigationLink(destination: ChallengeDetailedView(modelContext: modelContext, challenge: currentChallenge)){
                                        GroupBox{
                                            VStack{
                                                Image(currentChallenge.imageName)
                                                    .resizable().aspectRatio(contentMode: .fit)
                                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                                    .padding()
                                                Text("For this challenge you need to...").font(.title2).foregroundStyle(.black)
                                                HStack{
                                                    Text("show details").font(.title2)
                                                    Image(systemName: "info.bubble")
                                                }
                                            }
                                            
                                        }.foregroundStyle(Color.blue)
                                    }
                                    
                                    VStack{
                                       
                                            Text("SPOILER ALERT: take a look at our future challenges").font(.title3)
                                        if challengess.isEmpty
                                        {
                                            var challenges = viewmodel.fillDatabaseWithChallenges()
                                        }
                                            ForEach (challengess) {challenge in
                                              
                                                
                                                HStack{
                                                    Text(challenge.name)
                                                }
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }
                .padding()
            }.background {
                //RoundedRectangle(cornerRadius: 40)
                // .foregroundColor(.white)
                // .opacity(0.5)
                //   .blur(radius: /*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
                // .scenePadding(/*@START_MENU_TOKEN@*/.minimum/*@END_MENU_TOKEN@*/, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //RoundedRectangle(cornerRadius: 30)
                //   .strokeBorder(.yellow, lineWidth: 10)
                // .frame(height: )
            }
            .navigationTitle("Today's Challenge")
            // .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
        }
        
        .tabItem {
            Label("Today's Challenge", systemImage: "cloud.sun")
        }
        MemoriesView()
            .tabItem{
                Label ("Memories", systemImage: "memories")
            }
        AchievementsView(cvm: viewmodel)
            .tabItem{
                Label("Achievements", systemImage: "trophy.fill")
            }
    } //end of tabview
}

}

/*#Preview {
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
 */

