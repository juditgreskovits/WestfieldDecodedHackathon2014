//
//  MyOutfitsViewController.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import UIKit

class MyOutfitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let kCellIdentifier: String = "OutfitCell"
    
    var imageCache = [String : UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println(MyColoursModel.instance.getOutfits())
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
        
        tableView.backgroundColor = UIColor.clearColor()
        tableView.opaque = false
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        
        var imageView = UIImageView(frame: CGRectMake(0,0,320,336))
        var image = UIImage(named: "outfit_formal0")
        imageView.image = image
        // cell.backgroundView = imageView
        // self.addSubView(imageView)
        
        /*imageCache["Bob"] = UIImage(named: "Bob.jpg")
        
        let imageOfBob = imageCache["Bob"]*/
        
        /*let category = MyColoursModel.instance.categories[indexPath.row] // myColoursModel.getCategories()[indexPath.row]
        cell.textLabel?.text = category.capitalizedString
        cell.detailTextLabel?.text = "Colours for my " + category + " outfits"
        
        // cell.imageView?.image = image
        
        println(cell.textLabel?.text);*/
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetHeight = self.view.frame.height/3
        
        return 336
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
