//
//  plateMeasureController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/17/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class plateMeasureController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var plateMeasureLabel: UILabel!
    
    @IBOutlet weak var plateLengthLabel: UILabel!
    @IBOutlet weak var plateWidthLabel: UILabel!
    @IBOutlet weak var meatHeightLabel: UILabel!
    @IBOutlet weak var meatChoiceLabel: UILabel!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    @IBOutlet weak var plateLengthTextField: UITextField!
    @IBOutlet weak var plateWidthTextField: UITextField!
    @IBOutlet weak var meatHeightTextField: UITextField!
    
    
    var meatChoice : String!
    
    @IBAction func nextButton(_ sender: Any) {
        
        if ((plateLengthTextField?.text) != "") && ((plateWidthTextField?.text) != "") && ((meatHeightTextField?.text) != "") {
            
            performSegue(withIdentifier: "plateMeasureSegue", sender: nil)
            
        } else {
            
            print("Error: Input fields")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        
        //set textfield delegates
        plateLengthTextField.delegate = self
        plateWidthTextField.delegate = self
        meatHeightTextField.delegate = self
        choiceLabel.text = meatChoice
        
        //set defaults for development
        plateLengthTextField.text = String(10)
        plateWidthTextField.text = String(10)
        meatHeightTextField.text = String(1)
        
        
        //set background gradient
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        plateMeasureLabel.setRadius()
        plateLengthLabel.setRadius()
        plateWidthLabel.setRadius()
        meatHeightLabel.setRadius()
        meatChoiceLabel.setRadius()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "plateLengthDefault") as? String{
            
            plateLengthTextField.text = x
            
        }
        if let x = UserDefaults.standard.object(forKey: "plateWidthDefault") as? String{
            
            plateWidthTextField.text = x
            
        }
        if let x = UserDefaults.standard.object(forKey: "meatHeightDefault") as? String{
            
            meatHeightTextField.text = x
            
        }
    }
    
    //if touch, hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "plateMeasureSegue" {
            
            let sendController = segue.destination as! cameraController
            sendController.plateLength = plateLengthTextField.text
            sendController.plateWidth = plateWidthTextField.text
            sendController.meatHeight = meatHeightTextField.text
            sendController.meatChoice = meatChoice
            
            
            
        }
        
    }
    
    
    
    
}
