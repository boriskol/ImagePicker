//
//  ContentView.swift
//  Shared
//
//  Created by Borna Libertines on 05/04/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
   
   @ObservedObject private var pickImage = ImagePickerViewModel()
   
   var body: some View {
      VStack {
         Image(uiImage:self.pickImage.image)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
         HStack {
            Button(action: {
               self.pickImage.pickAImage(sourceType: UIImagePickerController.SourceType.photoLibrary)
            }) {
               Text("Photo library").font(.title2)
            }
            Spacer()
            Button(action: {
               self.pickImage.pickAImage(sourceType: UIImagePickerController.SourceType.camera)
            }) {
               Text("Camera").font(.title2)
            }
         }.padding()
         
      }.sheet(isPresented: self.$pickImage.showSheet) {
         ImagePicker(sourceType: self.pickImage.sourceType, chosenImage: self.$pickImage.image)
      }
      
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
