//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by Borna Libertines on 05/04/22.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
   
   var sourceType = UIImagePickerController.SourceType.camera
   @Binding var chosenImage: UIImage
   @Environment(\.presentationMode) var presentationMode
   
   func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
      let myImagePicker = UIImagePickerController()
      myImagePicker.sourceType = sourceType
      myImagePicker.allowsEditing = true
      if sourceType == UIImagePickerController.SourceType.camera{
         myImagePicker.showsCameraControls = true
         myImagePicker.setEditing(true, animated: true)
         myImagePicker.cameraViewTransform = .identity
         myImagePicker.isEditing = true
        
         myImagePicker.preferredContentSize = CGSize(width: 200, height: 600)
         myImagePicker.cameraCaptureMode = UIImagePickerController.CameraCaptureMode.photo
      }
      myImagePicker.delegate = context.coordinator
      return myImagePicker
      
   }
   func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
   
   func makeCoordinator() -> Coordinator {
      Coordinator(self)
   }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
   var imagePicked: ImagePicker
   
   init(_ imagePicked: ImagePicker) {
      self.imagePicked = imagePicked
   }
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      //if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
         let watermark = UIImage(named: "50") //UIImage(named: "watermark")
         imagePicked.chosenImage = image.overlayWith(image: watermark ?? UIImage())
      }
      imagePicked.presentationMode.wrappedValue.dismiss()
   }
   
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      imagePicked.presentationMode.wrappedValue.dismiss()
   }
   
}

extension UIImage {
    // overlay any image on my image
    func overlayWith(image: UIImage) -> UIImage {
        let newSize = CGSize(width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        image.draw(in: CGRect(origin: CGPoint(x: size.width - 200, y: size.height - 200), size: CGSize(width: 200, height: 200)))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


