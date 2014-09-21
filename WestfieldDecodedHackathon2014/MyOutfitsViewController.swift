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
        
        return MyColoursModel.instance.getOutfits().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.backgroundColor = UIColor.clearColor()
        tableView.opaque = false
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.backgroundColor = MyColoursModel.instance.getOutfitBackgroundColour() //UIColor.clearColor() // f1f1f1
        cell.opaque = false
        
        let outfitVO = MyColoursModel.instance.getOutfits()[indexPath.row]
        
        println(outfitVO.image)
        
        // cell.textLabel?.text = "hello"
        
        // let outfitImageView = cell.viewWithTag(100) as UIImageView
        
        let image = UIImage(named: outfitVO.image)
        // let imageView = UIImageView(frame: CGRectMake(0, 0, image.size.width, image.size.height))
        let imageView = cell.viewWithTag(100) as UIImageView
        // cell.imageView?.image = image
        imageView.image = image
        
        var text = cell.viewWithTag(101) as UITextField
        text.text = outfitVO.store
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let targetHeight = self.view.frame.height/3
        
        return 336
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Get the row data for the selected row
        MyColoursModel.instance.selectOutfit(indexPath.row)
        
        let mapViewController = self.storyboard?.instantiateViewControllerWithIdentifier("mapViewController") as MapViewController
        self.navigationController?.pushViewController(mapViewController, animated: true)
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
