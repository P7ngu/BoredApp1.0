//
//  MemoriesView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct MemoriesView: View {
    var viewmodel = MemoryViewModel()
    var completedChallenges = MemoryViewModel().checkCompletedChallenges()
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(completedChallenges){ memory in
                    
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
        
        
        
        #Preview {
            MemoriesView()
        }
