//
//  ViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MycoloursModelDelegate  {
    
    let myColoursModel = MyColoursModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myColoursModel.getCategories()
    }

    @IBAction func myColoursButtonTouchUp(sender: AnyObject) {
        let myColoursViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myColoursViewController") as MyColoursViewController
        self.navigationController?.pushViewController(myColoursViewController, animated: true)
    }
    
    @IBAction func chooseMyColoursButtonTouchUp(sender: AnyObject) {
        let chooseMyColoursViewController = self.storyboard?.instantiateViewControllerWithIdentifier("chooseMyColoursViewController") as ChooseMyColoursViewController
        self.navigationController?.pushViewController(chooseMyColoursViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // model methods
    
    func getCategories() -> Array<String> {
        return myColoursModel.getCategories()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let controller = segue.destinationViewController as MyColoursViewController
        controller.testVariable = "Hello"
    }
    
    
    
    /*override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!){
        if segue.identifier == "editOrder" {
            var vc = segue.destinationViewController as EditPizzaViewController
            let orderNumber = orderNumberText.text.toInt()!
            vc.pizza = pizzaOrder.getPizzaOrder(orderNumber)
            vc.orderNumber = orderNumber
            vc.delegate = self
        }
    }*/

}

