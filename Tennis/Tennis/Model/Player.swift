//
//  Player.swift
//  Tennis
//
//  Created by Akshay Badve on 11/12/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation

class Player {
    
    var name:String
    var points:Int = 0
    
    init(playerName:String) {
        
        self.name = playerName
        self.points = 0
    }
    
    
    /// Function to increase player points
    func increasePlayerPoints() {
        points = points + 1
    }
}
