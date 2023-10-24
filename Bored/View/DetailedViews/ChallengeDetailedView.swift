//
//  ChallengeDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI

struct ChallengeDetailedView: View {
    var viewmodel = ChallengeViewModel();
    
    var challenge = Challenge(name: "Test challenge", content: "Test content", completed: true)
    
    @State var isPickerShowing = false
    
    @State var selectedImage: UIImage = UIImage()
    
    
    
    var body: some View {
        ZStack{ //to change the background color
            // .blue.ignoresSafeArea().opacity(0.5)
            
            
            VStack{
                Text(challenge.name + ": ")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
             
                
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
                
                Button{
                    isPickerShowing = true
                } label: {
                    Text("Select a Photo")
                }
                .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                    
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    
                }.padding(20)
                
                Text("Your notes: ")
                    .font(.title3)
                TextEditor(text: .constant("This activity helped me connect with my mind!"))
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .foregroundColor(.gray).padding(10)
            }
        }
    }
}

#Preview {
    ChallengeDetailedView()
}
