//
//  ChallengeDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import SwiftData

struct ChallengeDetailedView: View {
    @State var viewmodel: ChallengeViewModel
    
    init(modelContext: ModelContext, challenge: Challenge){
        var viewmodel = ChallengeViewModel(modelContext: modelContext)
        _viewmodel = State(initialValue: viewmodel)
        self.challenge = challenge
    }
    
    var challenge = Challenge(id: UUID(), name: "Test challenge", content: "Test content test siejwodijwoifjeoijfioewjfioewjfoiejfoiewjoifjoeifjofie",  completed: false, imageName: "noimagename", assignedDate: Time().getCurrentDate())
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage = UIImage()
    @State private var showingConfirmation = false
    @FocusState var isFocused: Bool
    
    
    @State var userNotes: String = ""
    @Query var memories: [Memory]
    @Query var challenges: [Challenge]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ScrollView{
            NavigationView{
                ZStack{
                    VStack{
                        GroupBox{
                            ZStack{
                                Image(challenge.imageName)
                                    .resizable()  //.aspectRatio(contentMode: .fit)
                                // .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .frame(width: 250, height: 250)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                
                                if (selectedImage != nil){
                                    Image (uiImage: selectedImage)
                                        .resizable()
                                    //.aspectRatio(contentMode: .fit)
                                    // .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .frame(width: 250, height: 250)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                            }
                            Text(challenge.content)
                                .font(.callout).padding()
                            ZStack{
                                ForEach (challenges) { chall in
                                    if (chall.name == challenge.name){
                                        if(chall.completed == false){
                                            GroupBox(label:
                                                        Label("Your notes:", systemImage: "pencil.line")
                                            ){ TextField("Notes", text: $userNotes, prompt: Text("Please input your notes"), axis: .vertical)
                                                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                                                    .foregroundStyle(.gray)
                                                    .foregroundColor(Color.gray)
                                                    .focused($isFocused)
                                                
                                                Button("Done!") {
                                                    let notes = userNotes
                                                    
                                                    MemoryViewModel(challenges: challenges).convertChallengeIntoMemory(challenge: challenge, context: modelContext, notes: notes)
                                                    
                                                    // viewmodel.completedChallengeCounter += 1 //not persistent
                                                    showingConfirmation = true
                                                    chall.completed = true
                                                    challenge.completed = true
                                                    
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
                                            //.foregroundColor(Color.gray)
                                        }
                                    } //endif
                                }//end for
                            }//end zstack
                        }
                    }
                }
            }.navigationTitle(challenge.name)
                .toolbar{
                    Button{
                        if(challenge.completed == true){
                            isPickerShowing = false
                        } else{
                            isPickerShowing = true
                        }
                    } label: {
                        Text("")
                        if(challenge.completed == true){
                            Image(systemName: "")
                        } else{
                            Image(systemName: "photo.badge.plus")
                        }
                       
                    }
                    .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                        ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    }
                }
        }.onTapGesture {
            //dismiss keyboard
            isFocused = false
        }
    }
}

/*#Preview {
 ChallengeDetailedView()
 }
 */
