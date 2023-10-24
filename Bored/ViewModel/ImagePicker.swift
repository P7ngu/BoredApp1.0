//
//  ImagePicker.swift
//  Bored
//
//  Created by Matteo Perotta on 20/10/23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var selectedImage: UIImage
    
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController();
        imagePicker.sourceType = .camera
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate =  context.coordinator //object that can receive UIImagePickerControllerEvents
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker){
        self.parent = picker
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //When the user cancels the picker UI
        print ("selection cancelled")
        //Dismsis picker
        parent.isPickerShowing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //When the user selected a media
        print ("image selected")
            
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
           
            
            DispatchQueue.main.async {
                // We succeded retrieving th eimage
                self.parent.selectedImage = image
               // ChallengeViewModel().markTodaysChallengeAsCompleted()
               // ChallengeViewModel().updateChallenge
                
            }
        }
        //Dismsis picker
        parent.isPickerShowing = false
        
    }
}
