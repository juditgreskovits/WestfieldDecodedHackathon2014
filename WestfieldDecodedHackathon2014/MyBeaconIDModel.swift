//
//  MyBeaconIDModel.swift
//  WestfieldDecodedHackathon2014
//
//  Created by Maya Bonkowski on 21/09/2014.
//  Copyright (c) 2014 JUDIT GRESKOVITS. All rights reserved.
//

import Foundation

class MyBeaconIDModel {
    
    class var instance:MyBeaconIDModel {
        return MyBeaconIDModelInstance
    }
    
    var beaconID: Int = 0;
    
    func setBeaconID(newID:Int) {
        self.beaconID = newID
        return
    }
    
    func getBeaconID() -> Int {
        return beaconID
    }
}

let MyBeaconIDModelInstance = MyBeaconIDModel()
