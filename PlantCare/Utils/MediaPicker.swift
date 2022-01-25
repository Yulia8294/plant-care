//
//  MediaPicker.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/20/22.
//

import UIKit
import PhotosUI

typealias MediaPickerCompletion = (_ image: UIImage) -> Void

class MediaPicker: NSObject, UINavigationControllerDelegate {
    
    var completion: MediaPickerCompletion?
    weak var controller: UIViewController?
    
    func showPhotoMenu(presentingController: UIViewController, sender: UIView, _ completion: @escaping MediaPickerCompletion) {
        self.completion = completion
        self.controller = presentingController
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Choose from device", style: .default) { [weak self] _ in
            self?.showImagePicker()
        })
        
        alert.addAction(UIAlertAction(title: "Take photo",   style: .default) { [weak self] _ in
            self?.showCameraPicker()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.popoverPresentationController?.sourceView = sender
        
        presentingController.present(alert, animated: true)
    }

    private func showImagePicker() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        controller?.present(picker, animated: true)
    }
    
    private func showCameraPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        controller?.present(picker, animated: true)
    }
    
    private func checkCameraPermission(_ success: @escaping () -> ()) {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            success()
            return
        }
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
            DispatchQueue.main.async {
                if granted == true { success() }
                else   { return }
            }
        });
    }
}

extension MediaPicker: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[.editedImage] as? UIImage {
            completion?(pickedImage)
        }
    }
}

extension MediaPicker: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let itemProvider = results.first?.itemProvider {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard let img = image else {
                    return
                }
                self.completion?(img as! UIImage)
            }
        }
        
    }
}
