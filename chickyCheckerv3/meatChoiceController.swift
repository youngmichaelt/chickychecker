//
//  meatChoiceController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/17/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class meatChoiceController : UIViewController {
    
    
    
    @IBOutlet weak var chooseMeatLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var chickenButtonView: UIView!
    @IBOutlet weak var beefButtonView: UIView!
    @IBOutlet weak var porkButtonView: UIView!
    @IBOutlet weak var fishButtonView: UIView!
    
    //init variables
    var meatChoice : String!
    
    @IBAction func chickenButton(_ sender: Any) {
        
        meatChoice = "Chicken"
        chickenButtonView.setRadius60()
        beefButtonView.setRadius20()
        porkButtonView.setRadius20()
        fishButtonView.setRadius20()
        
        
        
    }
    @IBAction func beefButton(_ sender: Any) {
        
        meatChoice = "Beef"
        chickenButtonView.setRadius20()
        beefButtonView.setRadius60()
        porkButtonView.setRadius20()
        fishButtonView.setRadius20()
        
        
    }
    
    @IBAction func porkButton(_ sender: Any) {
        
        meatChoice = "Pork"
        chickenButtonView.setRadius20()
        beefButtonView.setRadius20()
        porkButtonView.setRadius60()
        fishButtonView.setRadius20()
    }
    
    @IBAction func fishButton(_ sender: Any) {
        
        meatChoice = "Fish"
        chickenButtonView.setRadius20()
        beefButtonView.setRadius20()
        porkButtonView.setRadius20()
        fishButtonView.setRadius60()
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        if meatChoice != nil {
            
            performSegue(withIdentifier: "meatChoiceSegue", sender: nil)
            
        } else {
            
            print("Error: Meat Not Selected")
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        //set background gradient
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        chooseMeatLabel.setRadius()
        
        backgroundView.setRadius20()
        
        chickenButtonView.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.lightBlue)
        chickenButtonView.setRadius20()
        
        beefButtonView.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        beefButtonView.setRadius20()
        
        porkButtonView.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.lightBlue)
        porkButtonView.setRadius20()
        
        fishButtonView.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        fishButtonView.setRadius20()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "meatChoiceSegue"{
            
            let sendController = segue.destination as! plateMeasureController
            
            sendController.meatChoice = meatChoice
            
            
        }
        
        
    }
    
    
    
}
