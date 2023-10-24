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
    
    @State var selection: String = "Unaccepted"
    let filterOptions: [String] = ["Unaccepted", "Accepted"]
    
    
    var body: some View {
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
                            .frame(width: 300, height: 300)
                            .padding()
                    }
                }
                Picker(
                    selection: $selection,
                    label:
                        HStack {
                            Text("Challange:")
                            Text(selection)
                        }
                    ,
                    content: {
                        ForEach(filterOptions, id: \.self) { option in
                            Text(option)
                            .tag(option)}
                    })
                .pickerStyle(.segmented)
                
                
                Text(challenge.name + ": ")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text(challenge.content)
                    .font(.callout).padding()
                
                Button{
                    isPickerShowing = true
                } label: {
                    Text("Select a Photo")
                }
                .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                    
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                    
                }
            }
        }
    }
}

#Preview {
    ChallengeDetailedView()
}
