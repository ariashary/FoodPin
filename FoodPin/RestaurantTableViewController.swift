//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Muhammad Ashary on 22/07/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen.jpg", isVisited: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.locationType.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none

        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call fetaure is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        // Check-in action
        let actionTitles = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
        let checkInAction = UIAlertAction(title: actionTitles, style: .default, handler: { (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        })
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    */

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: { (action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete Button
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) -> Void in
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        deleteAction.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 203/255, alpha: 1)
            
        return [deleteAction, shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }

}
