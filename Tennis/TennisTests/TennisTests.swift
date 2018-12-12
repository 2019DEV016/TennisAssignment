//
//  TennisTests.swift
//  TennisTests
//
//  Created by Akshay Badve on 11/12/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import XCTest
@testable import Tennis

class TennisTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFirstPlayerWins() {
        
        let firstPlayer = Player(playerName: "Player 1")
        let secondPlayer = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        
        XCTAssertTrue(game.getScoreStatusMessage() == "Player 1 wins")
        XCTAssertTrue(game.getPlayerScore(selectedPlayer: .PlayerOne) == "--")
        XCTAssertTrue(game.getPlayerScore(selectedPlayer: .PlayerTwo) == "--")
    }
    
    func testSecondPlayerWins() {
        
        let firstPlayer = Player(playerName: "Player 1")
        let secondPlayer = Player(playerName: "Player 2")
        
        let game = Game(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        
        XCTAssertTrue(game.getScoreStatusMessage() == "Player 2 wins")
        XCTAssertTrue(game.getPlayerScore(selectedPlayer: .PlayerOne) == "--")
        XCTAssertTrue(game.getPlayerScore(selectedPlayer: .PlayerTwo) == "--")
    }

}
