//
//  Game.swift
//  Tennis
//
//  Created by Akshay Badve on 11/12/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation

enum SelectedPlayer {
    case PlayerOne
    case PlayerTwo
}

class Game {
    
    private let playerOne: Player;
    private let playerTwo: Player;

    /// Initialize Game object
    ///
    /// - Parameters:
    ///   - firstPlayer: the first player
    ///   - secondPlayer: the second player
    init(firstPlayer: Player, secondPlayer: Player) {
        
        self.playerOne = firstPlayer
        self.playerTwo = secondPlayer
    }
    
   
    /// Function to get match status message
    ///
    /// - Returns: returns score status in string format
    func getScoreStatusMessage() -> String {
        
        if self.playerOne.points < Constants.IntegerConstants.four && self.playerTwo.points < Constants.IntegerConstants.four {
            
            return "\(self.playerOne.name) \(self.getScoredPointsStatusMessageInStringFormat(points: self.playerOne.points)) - " +
            "\(self.playerTwo.name) \(self.getScoredPointsStatusMessageInStringFormat(points: self.playerTwo.points))"
        }
        
        let pointsDifference = self.playerOne.points - self.playerTwo.points
        
        if pointsDifference != Constants.IntegerConstants.zero {
            
            let currentPlayerName = pointsDifference > Constants.IntegerConstants.zero ? self.playerOne.name : self.playerTwo.name
            let status:String = pointsDifference * pointsDifference > Constants.IntegerConstants.two ? Constants.StringConstants.wins : Constants.StringConstants.advantage
            
            return currentPlayerName + status
        }
        
        return Constants.StringConstants.deuce
    }
    
    /// Function to take necessary actions when we select any player
    ///
    /// - Parameter selectedPlayer: currently selected player
    func performPlayerActionsWithRespectToPlayer(selectedPlayer: SelectedPlayer) {
        
        switch selectedPlayer {
        case .PlayerOne:
            self.playerOne.increasePlayerPoints()
        case .PlayerTwo:
            self.playerTwo.increasePlayerPoints()
        }
    }
    
    /// Function to get score of selected player
    ///
    /// - Parameter selectedPlayer: selected player instance
    /// - Returns: score in string format
    func getPlayerScore(selectedPlayer: SelectedPlayer) -> String {
        
        switch selectedPlayer {
        case .PlayerOne:
            return self.getScoredPointsInStringFormat(points: self.playerOne.points, opponentPoints: self.playerTwo.points)
        case .PlayerTwo:
            return self.getScoredPointsInStringFormat(points: self.playerTwo.points, opponentPoints: self.playerOne.points)
        }
    }
    
   
    /// Function to get scored points message
    ///
    /// - Parameter points: total points of player
    /// - Returns: scored points status in string format
    private func getScoredPointsStatusMessageInStringFormat(points:Int) -> String {
        
        switch points {
        case Constants.IntegerConstants.zero:
            return Constants.StringConstants.love
        case Constants.IntegerConstants.one:
            return Constants.StringConstants.fifteen
        case Constants.IntegerConstants.two:
            return Constants.StringConstants.thirty
        case Constants.IntegerConstants.three:
            return Constants.StringConstants.fourty
            
        default:
            return Constants.StringConstants.emptyString
        }
    }
   
    /// Function to get points scored to show on score board
    ///
    /// - Parameters:
    ///   - points: selected player points
    ///   - opponentPoints: opposite player points
    /// - Returns: scored points in string format
    private func getScoredPointsInStringFormat(points:Int, opponentPoints:Int) -> String {
        
        if points >= Constants.IntegerConstants.four && opponentPoints >= Constants.IntegerConstants.four && points - opponentPoints == Constants.IntegerConstants.one {
            
            return Constants.StringConstants.ad
        }
        
        if points < Constants.IntegerConstants.four && opponentPoints >= Constants.IntegerConstants.four {
            
            return Constants.StringConstants.draw
        }
        
        switch points {
        case Constants.IntegerConstants.zero:
            return String(points)
        case Constants.IntegerConstants.one:
            return Constants.StringConstants.fifteenDigit
        case Constants.IntegerConstants.two:
            return Constants.StringConstants.thirtyDigit
        case Constants.IntegerConstants.three:
            return Constants.StringConstants.fourtyDigit
            
        default:
            return Constants.StringConstants.draw
        }
    }
}
