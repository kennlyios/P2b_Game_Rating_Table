//
//  PlayersTableViewController.swift
//  P3-Ratings
//
//  Created by Nano on 2/08/2015.
//  Copyright (c) 2015 Self Taught iOS. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
    // create a variable call player which is an Array of playersData from the sample Data
    // in simple word, put sample data in the PlayerClass then call it as variable players
    
    var players: [Player] = playersData

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    //This create the number of section in Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    // this will return the cell in the table view, in this case, it return players length
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return players.count
    }


    // We have define the reusable cell call PlayerCell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerTableViewCell //1

        //inside this function define a constant(local scope) call player
        //which is the (global scope) players on its indexPath.row eg first row will pass in players(1) then cast it as Player which is a class define in the Player.swift
        let player = players[indexPath.row] as Player
        
        //since we already created IBOutlet for the tableview cell, we can just pass it in as player.name/game/imageForRating.
        cell.nameLabel.text = player.name
        cell.gameLabel.text = player.game
        cell.ratingImageView.image = imageForRating(player.rating)
        
        return cell
    }
    
    //This is a switch statement that will get the rating image, by using switch, when the rating is 1, it will use the 1StarSmall Image from the asset folder.
    
    func imageForRating(rating:Int) -> UIImage? {
        
        switch rating{
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }// end switch
        
    }// end func
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        //if the source is from PlayerDetailsTableViewController
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsTableViewController {
            
            //add the new player variable we created in PlayerDetailsTableViewController to the players array
            players.append(playerDetailsViewController.player)
            
            //update the tableView
            let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
        

    
    
}
