//
//  ChallengeDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import SwiftData

struct ChallengeDetailedView: View {
    var viewmodel = ChallengeViewModel();
    
    var challenge = Challenge(id: UUID(), name: "Test challenge", content: "Test content test siejwodijwoifjeoijfioewjfioewjfoiejfoiewjoifjoeifjofie",  completed: true, imageName: "noimagename", assignedDate: Time().getCurrentDate())
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage = UIImage()
    @State private var showingConfirmation = false
    
    @State var userNotes: String = ""
    @Query var memories: [Memory]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationView{
            ZStack{ //to change the background color
                Color.yellow.ignoresSafeArea().opacity(0.5)
                VStack{
                    ZStack{
                        Image(challenge.imageName)
                            .resizable()  //.aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 150)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        if (selectedImage != nil){
                            Image (uiImage: selectedImage)
                                .resizable()
                            //.aspectRatio(contentMode: .fit)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 150, height: 150)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        }
                    }
                    
                    Text(challenge.content)
                        .font(.callout).padding()
                    if(challenge.completed == false){
                        GroupBox(label:
                                    Label("Your notes:", systemImage: "pencil.line")
                        ){
                            
                            TextField("Notes", text: $userNotes, prompt: Text("Please input your notes"), axis: .vertical)
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                .foregroundStyle(.gray)
                                .foregroundColor(Color.gray)
                            Button("Save notes") {
                                let notes = userNotes
                                MemoryViewModel().convertChallengeIntoMemory(challenge: challenge, context: modelContext, notes: notes)
                                showingConfirmation = true
                                
                            }.alert("Notes saved!", isPresented: $showingConfirmation) {
                                Button("OK", role: .cancel) {
                                    showingConfirmation = false
                                }
                            }
                            
                        }
                    }else { // the challenge has already been completed, you can't edit the text anymore.
                            
                            Text("You have already completed this challenge, congratulations!")
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                .foregroundStyle(.purple)
                                .foregroundColor(Color.gray)
                        }
                    
                    
                
                
                
            }
        }
    }.navigationTitle(challenge.name)
        .toolbar{
            Button{
                isPickerShowing = true
            } label: {
                Text("")
                Image(systemName: "photo.badge.plus")
            }
            .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
            }
        }
    
}
}

#Preview {
    ChallengeDetailedView()
}
