//
//  ImagePickerMVVM.swift
//  ImagePicker
//
//  Created by Borna Libertines on 06/04/22.
//

import Foundation
import UIKit

class ImagePickerViewModel: ObservableObject {
   
   
   @Published var showSheet = false
   @Published var image = UIImage()
   @Published var sourceType: UIImagePickerController.SourceType = .camera
   
   public func pickAImage(sourceType: UIImagePickerController.SourceType){
      
      self.showSheet = true
      self.sourceType = sourceType
     // self.image = 
      
      
   }
   
   
   
   
   
   
}
