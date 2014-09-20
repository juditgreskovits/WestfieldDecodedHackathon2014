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
    
    let categories = ["basics", "relaxing", "dramatic"]
    var outfits = [Outfit(), Outfit(), Outfit()]
    
    func getCategories() -> Array<String> {
        return categories
    }
    
    func getOutfits() -> Array<Outfit> {
        return outfits
    }
}

let MyColoursModelInstance = MyColoursModel()