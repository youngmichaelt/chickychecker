//
//  drawViewController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/18/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class drawViewController : UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var Draw: Draw!
    
    @IBAction func calculateButton(_ sender: Any) {
        
        if Draw.xList.count >= 3 {
            area()
        } else {
            print("error make boxes")
        }
        
        if lengthsInches.count > 0 {
            
            performSegue(withIdentifier: "drawViewSegue", sender: nil)
            
        } else {
            
            print("Error")
        }
        
    }
    @IBAction func resetButton(_ sender: Any) {
        
        Draw.erase()
        
    }
    
    
    var image : UIImage!
    
    var plateLength : String!
    var plateWidth : String!
    var meatHeight : String!
    var meatChoice : String!
    
    // init variables to be sent to next view controller
    var lengthsInches : [Float] = []
    var widthsInches : [Float] = []
    var ouncesArray : [Float] = []
    var calories : Float!
    
    override func viewDidLoad() {
        
        imageView.image = image
        Draw?.backgroundColor = UIColor(white: 1, alpha: 0)
        
        //set background gradient
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        //set header corners
        headerLabel.setRadius()
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "drawViewSegue" {
            
            let sendController = segue.destination as! calculateController
            
            sendController.length = lengthsInches[0]
            sendController.width = widthsInches[0]
            sendController.ounce = ouncesArray[0]
            sendController.calories = calories
            
            
            sendController.plateLength = Float(plateLength)
            sendController.plateWidth = Float(plateWidth)
            sendController.image = image
            sendController.meatChoice = meatChoice
            
            
        }
        
        if segue.identifier == "drawViewBackSegue"{
            
            let sendController = segue.destination as! cameraController
            sendController.plateLength = plateLength
            sendController.plateWidth = plateWidth
            sendController.meatHeight = meatHeight
            sendController.meatChoice = meatChoice
        }
        
    }
    
    
    func area() {
        
        //get list of x and y values of boxess
        
        var xList = Draw.xList
        var yList = Draw.yList
        var xList2 = Draw.xList2
        var yList2 = Draw.yList2
        
        //init arrays
        var lengths : [Float] = []
        var widths : [Float] = []
        var areas : [Float] = []
        var areasInches : [Float] = []
        
        //get standard plate measurements
        let plate_length = Float(plateLength)
        let plate_width = Float(plateWidth)
        let plateArea = plate_length! * plate_width!
        
        //set default measurements for deck
        var deck_length = 3.5
        var deck_width = 2.5
        let deck_area = Float(8.75)
        let deck_oz = Float(3.5)
        
        //get width/length/area of first box(plate)
        let width = xList[1] - xList[0]
        let length = yList[3] - yList[0]
        let area = width * length
        
        widths.append(Float(width))
        lengths.append(Float(length))
        areas.append(Float(area))
        
        //get width/length/area of second box(food)
        let width2 = xList2[1] - xList2[0]
        let length2 = yList2[3] - yList2[0]
        let area2 = width2 * length2
        
        widths.append(Float(width2))
        lengths.append(Float(length2))
        areas.append(Float(area2))
        
        //get percent ratio of chicken to plate area (in pixels?)
        let percentage = areas[1] / areas[0]
        
        //percent ratio of plate area in inches to plate box pixels
        let a_percentage = Float(plateArea / areas[0])
        
        let areas_inches = areas[1] * a_percentage
        
        //circle area test
//        let circleRadius = ((width + length)/2)/2
//        let circleArea = Float.pi * Float((circleRadius)^2)
//        let circleRadius2 = ((width2 + length2)/2)/2
//        let circleArea2 = Float.pi * Float((circleRadius2)^2)
//        let percentage2 = circleArea2 / circleArea
//        let a_percentage2 = Float(plateArea / circleArea)
//        let areas_inches2 = circleArea2 * a_percentage2
        
        
        //convert areas to area inches
        for area in areas {
            
            let area = area * a_percentage
            areasInches.append(area)
            
        }
        
        //get proportions of plate to box pixel length
        let l0 = plate_length! / lengths[0]
        let w0 = plate_length! / widths[0]
        
        let l1 = l0 * lengths[1]
        let w1 = w0 * widths[1]
        
        let deck_area_percent = areas_inches / deck_area
        
        let ounces = deck_area_percent * deck_oz
        
        print("Areas: ", areas)
        print("Percentage: ", percentage)
        print("Areas in inches: " , areas_inches)
        print("Lengths/Widths: ",l0,w0,l1,w1)
        
        ouncesArray.append(ounces)
        lengthsInches.append(l1)
        widthsInches.append(w1)
        
        print("Ounces Array: ", ouncesArray)
        print("Ounces: ", ounces)
        
        //calorie calculation
        let chickenCaloriesDefault : Float = 47
        let beefCaloriesDefault : Float = 70
        let fishCaloriesDefault : Float = 33
        let porkCaloriesDefault : Float = 70
        print(meatChoice)
        
        if meatChoice == "Chicken"{
            
            calories = chickenCaloriesDefault * ounces
            
        }
        if meatChoice == "Beef"{
            
            calories = beefCaloriesDefault * ounces
            
        }
        if meatChoice == "Fish"{
            
            calories = fishCaloriesDefault * ounces
            
        }
        if meatChoice == "Pork"{
            
            calories = porkCaloriesDefault * ounces
            
        }
        
        //values to pass
//        var lengthPass : Float! = lengthsInches[0]
//        var widthPass : Float! = widthsInches[0]
//        var ouncePass : String = ouncesArray[0]
//        var caloriesPass : Float! = calories
        
        
        
        
    }
        
        
    
}

