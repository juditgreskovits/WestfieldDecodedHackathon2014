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
//    @IBOutlet var tableView: UITableView?
//    var beacons: [CLBeacon]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        let aSelector : Selector = "updateTime"
//        var selfTimer: NSTimer = NSTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
//        
        NSLog("image loader")
        
        let beaconID = MyBeaconIDModel.instance.getBeaconID()
        var mapName:String = "map" + String(beaconID)
        NSLog(mapName)
        
        var imageView = UIImageView(frame: CGRectMake(0,0,320,568))
        var image = UIImage(named: mapName)
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
