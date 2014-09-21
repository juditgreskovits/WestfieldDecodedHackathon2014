//
//  MapViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 21/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
//    var beacons: [CLBeacon]?

    override func viewDidLoad() {
        super.viewDidLoad()

//        NSLog("Checking Beacons exists")
//        if(beacons == nil) {
//            return
//        }
//
//        let beacon:CLBeacon = beacons![0]
////        let beaconID: Int = beacon.minor
//        var message:String = "beaconID: " + beacon.minor.stringValue
    
//        NSLog(message)
        
        // Do any additional setup after loading the view.
        NSLog("image loader")
        var imageView = UIImageView(frame: CGRectMake(0,0,320,568))
        var image = UIImage(named: "crap")
        imageView.image = image
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
