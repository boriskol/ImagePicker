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
               Image(systemName: "photo.circle.fill").font(.title2).foregroundColor(.red)
            }
            Spacer()
            Button(action: {
               self.pickImage.pickAImage(sourceType: UIImagePickerController.SourceType.camera)
            }) {
               Image(systemName: "camera.circle").font(.title2).foregroundColor(.red)
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
