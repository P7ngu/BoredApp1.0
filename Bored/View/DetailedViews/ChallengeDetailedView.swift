//
//  ChallengeDetailedView.swift
//  Bored
//
//  Created by Matteo Perotta on 19/10/23.
//

import SwiftUI
import CoreData
import PhotosUI

struct ChallengeDetailedView: View {
    var viewmodel = ChallengeViewModel();
    
    var challenge = Challenge(id: UUID(), name: "Test challenge", content: "Test content",  color: .blue, completed: true, imageName: "noimagename", assignedDate: Time().getCurrentDate())
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage = UIImage()
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State var selectedPhoto: PhotosPickerItem?
    // @State var selectedPhotoData: Data?
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView{
            ZStack{ //to change the background color
                // .blue.ignoresSafeArea().opacity(0.5)
                VStack{
                    HStack{
                        
                        Section{
                            if let imageData = challenge.image,
                               let uiImage = UIImage(data: imageData){
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 300)
                            }
                            
                            PhotosPicker(selection: $selectedPhoto,
                                         matching: .images,
                                         photoLibrary: .shared()){
                                Label("Add Image", systemImage: "photo")
                            }
                            
                            if challenge.image != nil {
                                // challenge.completed = true
                                Button(role: .destructive){
                                    withAnimation{
                                        selectedPhoto = nil
                                        challenge.image = nil
                                    }
                                } label: {
                                    Label ("Delete Image", systemImage: "xmark")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                        /* Image(challenge.imageName).resizable().aspectRatio(contentMode: .fit)
                         .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                         .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                         .padding()
                         */
                        if let imageData = challenge.image,
                           let uiImage = UIImage(data: imageData){
                            Image(uiImage: uiImage)
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
                /* Button{
                 isPickerShowing = true
                 } label: {
                 Text("")
                 Image(systemName: "photo.badge.plus")
                 }
                 .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                 ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                 
                 }.padding(20)*/
            }
            .task(id: selectedPhoto){ //when the value changes we perform this code
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                    print("selected photo updated")
                    challenge.image = data
                    //challenge.image = data
                }
            }
        
    }
}





#Preview {
    ChallengeDetailedView()
}
