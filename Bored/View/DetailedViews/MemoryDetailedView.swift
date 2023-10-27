//
//  MemoryDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import SwiftData

struct MemoryDetailedView: View {
    var viewmodel = MemoryViewModel();
    @Bindable var memory: Memory
    @State private var showingConfirmation = false
    @FocusState private var responseIsFocussed: Bool // dismiss response editor
    //var memory = Memory(name: "Test", content: "Test", notes: "Test", imageName: "")
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        Image(memory.imageName).resizable().aspectRatio(contentMode: .fit)
                        // .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                        Text(memory.content)
                            .font(.callout).padding()
                    
                            GroupBox(label:
                                        Label("Your notes:", systemImage: "pencil.line")
                            ){
                                
                                TextField("Notes", text: $memory.notes, prompt: Text("Please input your notes"), axis: .vertical)
                                    .focused($responseIsFocussed)
                                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                    .foregroundStyle(.gray)
                                    .foregroundColor(Color.gray)
                                
                                Button("Update notes") {
                                    let notes = memory.notes
                                    showingConfirmation = true
                                    responseIsFocussed = false
                                    
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
