//
//  MemoriesView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import SwiftData


struct MemoriesView: View {
    var viewmodel = MemoryViewModel()
    //var completedChallenges = MemoryViewModel().checkCompletedChallenges(context: modelContext)
    
    @Query var memories: [Memory]
    @Query var challengess: [Challenge]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            Color.pink.ignoresSafeArea().opacity(0.5)
            NavigationStack{
                List {
                    ForEach(memories){ memory in
                        
                        NavigationLink{
                            MemoryDetailedView(memory: memory)
                            
                        } label: {
                            HStack {
                                //opposite to VStack, there is also ZStack
                                Image(systemName: "checkmark.seal.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.blue);
                                Text (memory.name).bold()
                                
                            }.padding()
                            
                            
                        }
                        //.padding()
                    }
                }.navigationTitle("Memories")
            }
        }
    }
}
        
        
        
        #Preview {
            MemoriesView()
        }
