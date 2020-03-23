//
//  settingsController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/18/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class settingsController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var plateLengthTextField: UITextField!
    @IBOutlet weak var plateWidthTextField: UITextField!
    @IBOutlet weak var meatHeightTextField: UITextField!

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var defaultsLabel: UILabel!
    @IBOutlet weak var plateLengthLabel: UILabel!
    @IBOutlet weak var plateWidthLabel: UILabel!
    @IBOutlet weak var meatHeightLabel: UILabel!
    
    
    @IBAction func doneButton(_ sender: Any) {
        
        UserDefaults.standard.set(plateLengthTextField.text, forKey: "plateLengthDefault")
        UserDefaults.standard.set(plateWidthTextField.text, forKey: "plateWidthDefault")
        UserDefaults.standard.set(meatHeightTextField.text, forKey: "meatHeightDefault")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        headerLabel.setRadius()
        defaultsLabel.setRadius()
        plateLengthLabel.setRadius()
        plateWidthLabel.setRadius()
        meatHeightLabel.setRadius()
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
