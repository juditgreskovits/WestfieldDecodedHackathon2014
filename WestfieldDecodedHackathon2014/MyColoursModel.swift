//
//  MyColoursModel.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import Foundation

class MyColoursModel {
    
    class var instance:MyColoursModel {
        return MyColoursModelInstance
    }
    
    var outfits = [OutfitVO(), OutfitVO(), OutfitVO()]
    
    let categories = ["formal", "casual", "wow"]
    
    let colours0 = ["formal":[], "casual":[], "wow":[]]
    let colours1 = ["formal":[], "casual":[], "wow":[]]
    
    var selectedColours:Dictionary<String, Array<AnyObject>>?
    var selectedCategory:String?
    var selectedOutfits:Array<OutfitVO>!
    var selectedOutfit:OutfitVO?
    
    func selectColours(index:Int) {
        let colours = [colours0, colours1]
        selectedColours = colours[index]
    }
    
    func selectCategory(category:String) {
        selectedCategory = category
        
        println(selectedCategory)
        UIColor.initWithRGBHex(0xFFFFFF)
    }
    
    func getOutfits() -> Array<OutfitVO> {
        
        selectedOutfits = []
        
        
        return outfits
    }
    
    func selectOutfit(index:Int) {
        selectedOutfit = selectedOutfits[index]
    }
}

let MyColoursModelInstance = MyColoursModel()

import UIKit

extension UIColor {
    
    class func initWithRGBHex(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
    }
}