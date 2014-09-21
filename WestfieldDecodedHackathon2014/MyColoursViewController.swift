//
//  MyColoursViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit


class MyColoursViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let kCellIdentifier: String = "CategoryColoursCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.separatorInset = UIEdgeInsetsZero
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        let category = MyColoursModel.instance.categories[indexPath.row] // myColoursModel.getCategories()[indexPath.row]
        /*cell.textLabel?.text = category.capitalizedString
        cell.detailTextLabel?.text = "Colours for my " + category + " outfits"*/
        
        (cell.viewWithTag(100) as UILabel).text = category.capitalizedString + ": colours for my " + category + " outfits" //category.capitalizedString
        // (cell.viewWithTag(101) as UILabel).text = "Colours for my " + category + " outfits"
        
        var colour0 = MyColoursModel.instance.getColour(category, index: 0)
        var colour1 = MyColoursModel.instance.getColour(category, index: 1)
        var colour2 = MyColoursModel.instance.getColour(category, index: 2)
        let image = createSwatch(colour0, colour1: colour1, colour2: colour2)
        
        // cell.imageView?.image = image
        
        (cell.viewWithTag(102) as UIImageView).image = image
        
        println(cell.textLabel?.text);
        
        return cell
    }
    
    /*func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetHeight = self.view.frame.height/3
        
        return 168
    }
    
    func tableView(tableView: UITableView, widthForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetWidth = self.view.frame.width
        
        return targetWidth
    }*/
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Get the row data for the selected row
        var selectedCategory: String = MyColoursModel.instance.categories[indexPath.row] as String
        println(selectedCategory)
        MyColoursModel.instance.selectCategory(selectedCategory)
        
        let myOutfitsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myOutfitsViewController") as MyOutfitsViewController
        self.navigationController?.pushViewController(myOutfitsViewController, animated: true)
    }
    
    func createSwatch(colour0:UIColor, colour1:UIColor, colour2:UIColor) -> UIImage {
        
        let imageRect = CGRectMake(0, 0, 210, 70)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageRect.width, height: imageRect.height), true, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        println(colour0.CGColor)
        
        addColourToSwatch(0, context: context, colour: colour0)
        addColourToSwatch(70, context: context, colour: colour1)
        addColourToSwatch(140, context: context, colour: colour2)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image
    }
    
    func addColourToSwatch(offset:CGFloat, context:CGContext, colour:UIColor) {
        
        println(offset)
        
        let colourRect = CGRectMake(offset, 0, 70, 70)
        
        CGContextSetFillColorWithColor(context, colour.CGColor)
        
        CGContextFillRect(context, colourRect)
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
