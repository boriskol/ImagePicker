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
   
   @MainActor public func pickAImage(sourceType: UIImagePickerController.SourceType) async throws {
      self.showSheet = true
      self.sourceType = sourceType
   }
   
   
}
