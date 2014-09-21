//
//  OutfitVO.swift
//  WestfieldDecodedHackathon2014
//
//  Created by JUDIT GRESKOVITS on 20/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import Foundation

class OutfitVO {

    var store = "Desigual"
    var image = "image.jpg"
    var colour = "red"
    var price = "£76"
    
    init(_image:String, _store:String) {
        image = _image
        store = _store
    }
}
