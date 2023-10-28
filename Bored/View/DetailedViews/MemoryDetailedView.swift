//
//  MemoryDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import SwiftData

struct MemoryDetailedView: View {
    //var viewmodel = MemoryViewModel();
    @Bindable var memory: Memory
    @State private var showingConfirmation = false
    @FocusState var isFocused: Bool
    //var memory = Memory(name: "Test", content: "Test", notes: "Test", imageName: "")
    
    var body: some View {
        ScrollView{
            NavigationView{
                ZStack{
                    VStack{
                        Image(memory.imageName).resizable().aspectRatio(contentMode: .fit)
                        // .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                        Text(memory.content)
                            .font(.callout).padding()
                        
                        ZStack{
                            //RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/).size(width: 1000, height: 300)
                            GroupBox(label:
                                        Label("Your notes:", systemImage: "pencil.line")
                            ){
                                
                                TextField("Notes", text: $memory.notes, prompt: Text("You haven't written any notes yet, maybe try now!"), axis: .vertical)
                                    .focused($isFocused)
                                    //.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                    .foregroundStyle(.gray)
                                    .foregroundColor(Color.gray)
                                
                                Button("Update notes") {
                                    let notes = memory.notes
                                    // MemoryViewModel().convertChallengeIntoMemory(challenge: challenge, context: modelContext, notes: memory.notes)
                                    showingConfirmation = true
                                    
                                }.alert("Notes saved!", isPresented: $showingConfirmation) {
                                    Button("OK", role: .cancel) {
                                        showingConfirmation = false
                                    }
                                }
                            }
                        }
                    }
                }
            }.navigationTitle(memory.name)
        }.onTapGesture {
            //dismiss keyboard
            isFocused = false
            
        }
    }
}


#Preview {
    //modified to avoid preview crashing
    do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Memory.self, configurations: config)
        let example = Memory(name: "Test", content: "Challenge description", notes: "Notes", imageName: "noimage")
        return MemoryDetailedView(memory: example).modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
