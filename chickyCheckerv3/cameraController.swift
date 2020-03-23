//
//  cameraController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/18/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class cameraController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    @IBAction func cameraButton(_ sender: Any) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func galleryButton(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
            
        }
        
        
    }
    
    //init variables
    var imagePicker : UIImagePickerController!
    var image : UIImage!
    
    var plateLength : String!
    var plateWidth : String!
    var meatHeight : String!
    var meatChoice : String!
    
    @IBAction func nextButton(_ sender: Any) {
        
        if  image != nil {

            performSegue(withIdentifier: "cameraSegue", sender: nil)

        } else {

            print("Error: Image not set")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        
        //set background gradients
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        headerLabel.setRadius()
        previewLabel.setRadius()
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        image = info[.originalImage] as? UIImage
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        imageView.image = image
        previewLabel.alpha = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "cameraSegue" {

            let sendController = segue.destination as! drawViewController

            sendController.image = image
            
            sendController.plateLength = plateLength
            sendController.plateWidth = plateWidth
            sendController.meatHeight = meatHeight
            sendController.meatChoice = meatChoice
            

        }
        
        if segue.identifier == "cameraBackSegue" {
            
            let sendController = segue.destination as! plateMeasureController
            
            sendController.meatChoice = meatChoice
            
        }

    }

    
}
