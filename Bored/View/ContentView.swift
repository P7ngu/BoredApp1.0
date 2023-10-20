//
//  ContentView.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

//This is the Today challenges

import SwiftUI

struct ContentView: View {
    var viewmodel = ChallengeViewModel();
    var daycounter = 0;
    
    var currentDate = Time().getCurrentDate()
   
    
    
    @State var isPickerShowing = false
    
    @State var selectedImage: UIImage = UIImage()
    
    @State var selection: String = "Unaccepted"
    let filterOptions: [String] = ["Unaccepted", "Accepted"]
    
    
    var body: some View {
        TabView{
            NavigationStack{
                ScrollView{
                    VStack {
                        ZStack{
                            VStack{
                                
                                Text(viewmodel.challenges[daycounter].name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.red)
                                Text(currentDate)
                                
                                ZStack{
                                    Image(viewmodel.challenges[daycounter].imageName)
                                        .resizable()
                                        .dynamicTypeSize(.medium)
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Rectangle())
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .opacity(0.5)
                                        .padding(10)
                                        .frame(width: 300, height: 300)
                                    
                                    if (selectedImage != nil){
                                        Image (uiImage: selectedImage)
                                            .resizable()
                                            .frame(width: 300, height: 300)
                                            .padding()
                                    }
                                   
                                }
                                
                                
                                Text(viewmodel.challenges[daycounter].content).padding()
                                
                                
                                
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
                    .padding()
                }
                .navigationTitle("Today's Challenge is:")
            }
            .tabItem {
                Label("Today", systemImage: "cloud.sun")
            }
            MemoriesView()
                .tabItem{
                    Label ("Memories", systemImage: "memories")
                }
            AchievementsView()
                .tabItem{
                    Label("Achievements", systemImage: "trophy.fill")
                }
        } //end of tabview
    }
    
}

#Preview {
    ContentView()
}
