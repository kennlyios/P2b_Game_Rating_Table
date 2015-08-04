//
//  PlayerDetailsTableViewController.swift
//  P3-Ratings
//
//  Created by Nano on 3/08/2015.
//  Copyright (c) 2015 Self Taught iOS. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {
    
    var player: Player!
    
    var game:String = "Chess"

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var detailLabel: UILabel!


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // this create a first responder, when user got into this screen, it will automatcially show the textfield and allow user to type.
    
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    // create a function that when the segue identifer is SavePlayerDetail then create a Player instance with name, game and rating.Make sure to name the unwind scene to SavePlayerDetail in storboard.
    //Head back to PlayersTableViewController to create the unwind segue method
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text, game:game, rating: 1)
            
        }
        // if user click on pick game again the game should have a chceckmark next to it, pass the stored game
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerTableViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    

    // this is an unwind method from the GamePickerTableVIewController
    
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerTableViewController,
            // in the selectedGame from gamePickerViewController, assign the detailLabel text to it
            
            selectedGame = gamePickerViewController.selectedGame {
                detailLabel.text = selectedGame
                game = selectedGame
        }
    }
    
    //this code is just for understanding when will the viewcontroller be init and deinit, it doesnt effect the tableview.
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }
    


}
