//
//  GamePickerTableViewController.swift
//  P3-Ratings
//
//  Created by Nano on 3/08/2015.
//  Copyright (c) 2015 Self Taught iOS. All rights reserved.
//

import UIKit

class GamePickerTableViewController: UITableViewController {
    
    //these 2 variables is for sending data back in unwind segue
    var selectedGame:String? = nil
    var selectedGameIndex:Int? = nil
    
    var games: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // this create hard coded data and store in games array.
        games = ["Angry Birds",
            "Chess",
            "Russian Roulette",
            "Spin the Bottle",
            "Texas Hold'em Poker",
            "Tic-Tac-Toe"]
        
        //this take the game we passed from DetailTableViewController to an index
        if let game = selectedGame {
            selectedGameIndex = find(games, game)!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return games.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as! UITableViewCell

    
      cell.textLabel?.text = games[indexPath.row]
        
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        
        // remove checkmark when (non checkmark) row is selected, only one checkmark is allow
        if let index = selectedGameIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedGameIndex = indexPath.row
        selectedGame = games[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

// When the identifer is SaveSelected Game, use the cell indexPath and update to selectedGameIndex
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedGame" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                selectedGameIndex = indexPath?.row
                if let index = selectedGameIndex {
                    selectedGame = games[index]
                }
            }
        }
    }
   

}
