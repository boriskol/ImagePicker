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
               Task {
                  do {
                     try await self.pickImage.pickAImage(sourceType: UIImagePickerController.SourceType.photoLibrary)
                  } catch {
                     print(error)
                  }
               }
               
            }) {
               Image(systemName: "photo.circle.fill")
                  .foregroundColor(.red)
                  .scaledToFill()
                  .font(.system(size: 40))
                  .padding()
            }
            Spacer()
            Button(action: {
               Task {
                  do {
                     try await self.pickImage.pickAImage(sourceType: UIImagePickerController.SourceType.camera)
                  } catch {
                     print(error)
                  }
               }
               
            }) {
               Image(systemName: "camera.circle")
                  .foregroundColor(.red)
                  .scaledToFill()
                  .font(.system(size: 50))
                  .padding()
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
