//
//  MemoryDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct MemoryDetailedView: View {
    var viewmodel = MemoryViewModel();
    
    var memory = Challenge(name: "Test challenge", content: "Test content", completed: true)
    
    var body: some View {
        
        ZStack{ //to change the background color
           // .blue.ignoresSafeArea().opacity(0.5)
            
            
            VStack{
                Image(memory.imageName).resizable().aspectRatio(contentMode: .fit)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text(memory.name + ": ")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text(memory.content)
                    .font(.callout)
            }
        }
    }
}

#Preview {
    MemoryDetailedView()
}
