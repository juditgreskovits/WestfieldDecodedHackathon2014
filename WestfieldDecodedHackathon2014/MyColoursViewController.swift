//
//  MyColoursViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit

class MyColoursViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let categories = ["basics", "relaxing", "dramatic"]
    
    let kCellIdentifier: String = "CategoryColoursCell"
    
    var testVariable: String? = nil
    
    var myColoursModel: MyColoursModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*for category in categories {
            // let image = UIImage(named: "name") as UIImage
            let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(100, 100, 100, 100)
            // button.setImage(image, forState: .Normal)
            button.addTarget(self, action: "btnTouched:", forControlEvents:.TouchUpInside)
            self.view.addSubview(button)
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCategoryColours")
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        let category = categories[indexPath.row] // myColoursModel.getCategories()[indexPath.row]
        cell.textLabel?.text = category.capitalizedString
        cell.detailTextLabel?.text = "Colours for my " + category + " outfits"
        
        println(cell.textLabel?.text);
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetHeight = self.view.frame.height/3
        
        return targetHeight
    }
    
    func tableView(tableView: UITableView, widthForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetWidth = self.view.frame.width
        
        return targetWidth
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Get the row data for the selected row
        var selectedCategory: String = self.categories[indexPath.row] as String
        
        /*var alert: UIAlertView = UIAlertView()
        alert.title = "category"
        alert.message = selectedCategory
        alert.addButtonWithTitle("Ok")
        alert.show()*/
        
        // TODO set the selected category to our model
        // Request the results page!
        
        println(myColoursModel);
        
        let myOutfitsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myOutfitsViewController") as MyOutfitsViewController
        self.navigationController?.pushViewController(myOutfitsViewController, animated: true)
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
