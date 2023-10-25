//
//  ChallengeDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct ChallengeDetailedView: View {
    var viewmodel = ChallengeViewModel();
    
    var challenge = Challenge(id: UUID(), name: "Test challenge", content: "Test content",  color: .blue, completed: true, imageName: "noimagename", assignedDate: Time().getCurrentDate())
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage = UIImage()
    
    var body: some View {
        NavigationView{
            ZStack{ //to change the background color
                // .blue.ignoresSafeArea().opacity(0.5)
                VStack{
                    ZStack{
                        Image(challenge.imageName).resizable().aspectRatio(contentMode: .fit)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                        if (selectedImage != nil){
                            Image (uiImage: selectedImage)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding()
                        }
                    }
                    
                    Text(challenge.content)
                        .font(.callout).padding()
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
                }.padding(20)
            }
           
    }
}

#Preview {
    ChallengeDetailedView()
}
