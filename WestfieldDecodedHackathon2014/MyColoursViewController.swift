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
        // let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCategoryColours")
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        let category = MyColoursModel.instance.categories[indexPath.row] // myColoursModel.getCategories()[indexPath.row]
        cell.textLabel?.text = category.capitalizedString
        cell.detailTextLabel?.text = "Colours for my " + category + " outfits"
        
        var colour = MyColoursModel.instance.getColour(category, index: 2)
        println(colour)
        let image = createSwatch(colour)
        
        cell.imageView?.image = image
        
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
        var selectedCategory: String = MyColoursModel.instance.categories[indexPath.row] as String
        println(selectedCategory)
        MyColoursModel.instance.selectCategory(selectedCategory)
        
        let myOutfitsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myOutfitsViewController") as MyOutfitsViewController
        self.navigationController?.pushViewController(myOutfitsViewController, animated: true)
    }
    
    func createSwatch(colour:UIColor) -> UIImage {
        
        let rect = CGRectMake(0, 0, 100, 100)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.width, height: rect.height), true, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        println(colour.CGColor)
        
        CGContextSetFillColorWithColor(context, colour.CGColor)
        
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return image
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
