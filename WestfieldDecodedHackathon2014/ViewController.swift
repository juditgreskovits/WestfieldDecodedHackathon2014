//
//  ViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func myColoursButtonTouchUp(sender: AnyObject) {
        let myColoursViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myColoursViewController") as MyColoursViewController
        self.navigationController?.pushViewController(myColoursViewController, animated: true)
    }
    
    @IBAction func chooseMyColoursButtonTouchUp(sender: AnyObject) {
        let chooseMyColoursViewController = self.storyboard?.instantiateViewControllerWithIdentifier("chooseMyColoursViewController") as ChooseMyColoursViewController
        self.navigationController?.pushViewController(chooseMyColoursViewController, animated: true)
    }
    
    @IBAction func mapButtonTouchUp(sender: AnyObject) {
        let mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as MapViewController
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

