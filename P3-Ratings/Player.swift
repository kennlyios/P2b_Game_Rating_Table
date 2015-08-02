//
//  Player.swift
//  P3-Ratings
//
//  Created by Nano on 2/08/2015.
//  Copyright (c) 2015 Self Taught iOS. All rights reserved.
//

import Foundation
import UIKit

// this is a simple data model for the player, in here, we create the variable display in the table view cell name, game and rating. then we use the initialization method to initialize the variable in the class.

class Player: NSObject{
    var name: String
    var game: String
    var rating: Int
    
    init (name:String, game:String, rating: Int){
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
