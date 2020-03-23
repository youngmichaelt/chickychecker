//
//  ViewController.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/16/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import GoogleMobileAds
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet var bannerView: GADBannerView!
    
    var interstitial: GADInterstitial!
    
    @IBOutlet var chickyCheckerLabel: UILabel!
    @IBOutlet weak var chickyCheckerLabelView: UIView!
    
    @IBOutlet weak var startButtonView: UIView!
    
    
    @IBOutlet weak var settingsButtonView: UIButton!
    @IBAction func settingsButton(_ sender: Any) {
        
        
        
    }
    //    @IBOutlet weak var chickyCheckerLabelView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set background as gradient background
        view.setGradientBackground(colorOne: Colors.lightBlue, colorTwo: Colors.blue)
        
        
        chickyCheckerLabel.setRadius()
        startButtonView.layer.cornerRadius = 20
        startButtonView.layer.masksToBounds = true

        
        settingsButtonView.layer.cornerRadius = 20
        settingsButtonView.layer.masksToBounds = true
        
        
        
        //set banner ad
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        
        Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(ViewController.CreateAd), userInfo: nil, repeats: false)
        
        
    }

    
    @objc func CreateAd() {
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
    }

}

