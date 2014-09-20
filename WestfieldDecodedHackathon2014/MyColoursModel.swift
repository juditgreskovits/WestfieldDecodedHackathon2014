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
    
    let colours0 = ["formal":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)], "casual":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)], "wow":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)]]
    let colours1 = ["formal":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)], "casual":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)], "wow":[UIColor.initWithRGBHex(0xCCCCCC), UIColor.initWithRGBHex(0x999999), UIColor.initWithRGBHex(0x666666)]]
    
    var selectedColours:Dictionary<String, Array<UIColor>>?
    var selectedCategory:String?
    var selectedOutfits:Array<OutfitVO>!
    var selectedOutfit:OutfitVO?
    
    func selectColours(index:Int) {
        //let colours = [colours0, colours1]
        if(index == 0) {
            selectedColours = colours0
        }
        else {
            selectedColours = colours1
        }
    }
    
    func selectCategory(category:String) {
        selectedCategory = category
        
        println(selectedCategory)
        UIColor.initWithRGBHex(0xFFFFFF)
    }
    
    func getColours() -> Dictionary<String, Array<UIColor>> {
        // TODO update this once we select colours
        return colours0
    }
    
    func getColour(category:String, index:Int) -> UIColor {
        var colours : Array<UIColor>! = getColours()[category] as Array<UIColor>?
        var colour = colours[index]
        return colour
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
