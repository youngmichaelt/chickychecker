//
//  calculateController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/18/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class calculateController : UIViewController {
    
    @IBOutlet weak var calculateHeader: UILabel!
    
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var ounceLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
    @IBOutlet weak var lengthOutput: UILabel!
    @IBOutlet weak var widthOutput: UILabel!
    @IBOutlet weak var ouncesOutput: UILabel!
    @IBOutlet weak var caloriesOutput: UILabel!
    
    var ounce : Float!
    var length : Float!
    var width : Float!
    var calories : Float!
    
    var plateLength : Float!
    var plateWidth : Float!
    var image : UIImage!
    var meatChoice : String!
    
    
    override func viewDidLoad() {
        
        //set gradient background
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        calculateHeader.setRadius()
        lengthLabel.setRadius()
        widthLabel.setRadius()
        ounceLabel.setRadius()
        caloriesLabel.setRadius()
        
        var multiplier = pow(10.0, 2.0)
        var m = Float(multiplier)
        length = round(length * m) / m
        width = round(width * m) / m
        ounce = round(ounce * m) / m
        calories = round(calories * m) / m
        
        ouncesOutput.text = String(ounce)
        lengthOutput.text = String(length)
        widthOutput.text = String(width)
        caloriesOutput.text = String(calories)
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculateResetSegue" {
            
            let sendController = segue.destination as! drawViewController
            
            sendController.plateLength = String(plateLength)
            sendController.plateWidth = String(plateWidth)
            
            sendController.image = image
            
            sendController.meatChoice = meatChoice
            
            
        }
    }
    
    
}
