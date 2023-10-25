//
//  MemoryDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct MemoryDetailedView: View {
    var viewmodel = MemoryViewModel();
    
    var memory = Challenge(id: UUID(), name: "Test challenge", content: "Test content",  color: .blue, completed: true, imageName: "noimagename", assignedDate: Time().getCurrentDate())
    
    
    var body: some View {
        NavigationView{
            ZStack{ //to change the background color
                // .blue.ignoresSafeArea().opacity(0.5)
                
                
                VStack{
                    Image(memory.imageName).resizable().aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                    Text(memory.content)
                        .font(.callout).padding()
                    
                    ZStack{
                        //RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/).size(width: 1000, height: 300)
                        GroupBox(label: 
                                    Label("Your notes:", systemImage: "pencil.line")
                                 ){
                            
                            TextEditor(text: .constant("This activity helped me connect with my mind!"))
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                .foregroundStyle(.gray)
                                .foregroundColor(Color.gray)
                        }
                            
                    }
                }
            }
        }.navigationTitle(memory.name)
    }
}

#Preview {
    MemoryDetailedView()
}
