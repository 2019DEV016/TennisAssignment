//
//  TennisViewController.swift
//  Tennis
//
//  Created by Akshay Badve on 11/12/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit

class TennisViewController: UIViewController {
    // MARK: variables and constants

    private var firstPlayer: Player
    private var secondPlayer: Player
    private var game:Game
    private let federer = "Federer"
    private let nadal = "Nadal"
    
    // MARK: Outlets

    @IBOutlet weak var firstPlayerNameLabel: UILabel!
    @IBOutlet weak var secondPlayerNameLabel: UILabel!
    @IBOutlet weak var firstPlayerScoreLabel: UILabel!
    @IBOutlet weak var secondPlayerScoreLabel: UILabel!
    @IBOutlet weak var scoreStatusMessageLabel: UILabel!
    
    // MARK: Init Methods

    required init?(coder aDecoder: NSCoder) {
        
        self.firstPlayer = Player(playerName: federer)
        self.secondPlayer = Player(playerName: nadal)
        self.game = Game(firstPlayer: self.firstPlayer, secondPlayer: self.secondPlayer)
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle methods

    override func viewDidLoad() {
        
        super.viewDidLoad()
        initializePlayerNames()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Custom methods

    /// Function to initialize player names to display
    private func initializePlayerNames() {
        self.firstPlayerNameLabel.text = self.firstPlayer.name
        self.secondPlayerNameLabel.text = self.secondPlayer.name
    }
    
    /// Function to update score label
    private func updateScoreLabel() {
        
        self.firstPlayerScoreLabel.text = self.game.getPlayerScore(selectedPlayer: .PlayerOne)
        self.secondPlayerScoreLabel.text = self.game.getPlayerScore(selectedPlayer: .PlayerTwo)
        self.scoreStatusMessageLabel.text = self.game.getScoreStatusMessage()
        
        if (scoreStatusMessageLabel.text?.contains(Constants.StringConstants.wins))! {
            initializeGame()
        }
    }

    /// Function to initialize players
    private func initializeGame() {
        
        self.firstPlayer = Player(playerName: federer)
        self.secondPlayer = Player(playerName: nadal)
        self.game = Game(firstPlayer: self.firstPlayer, secondPlayer: self.secondPlayer)
    }
    
    // MARK: Button actions
    
    @IBAction func onClickOfPlayerOneButton(_ sender: Any) {
        self.game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerOne)
        self.updateScoreLabel()
    }
    
    @IBAction func onClickOfPlayerTwoButton(_ sender: Any) {
        self.game.performPlayerActionsWithRespectToPlayer(selectedPlayer: .PlayerTwo)
        self.updateScoreLabel()
    }
    
}
