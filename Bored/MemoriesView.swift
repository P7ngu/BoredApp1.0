//
//  MemoriesView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct MemoriesView: View {
    var viewmodel = MemoryViewModel()
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(viewmodel.memories){ memory in
                    
                    NavigationLink{
                        MemoryDetailedView(memory: memory)
                        
                    } label: {
                        HStack {
                            //opposite to VStack, there is also ZStack
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .foregroundStyle(.blue);
                            Text (memory.name)
                            Text (memory.content)
                        }
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
