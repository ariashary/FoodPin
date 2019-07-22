//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Muhammad Ashary on 22/07/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    @IBOutlet var restaurantImageView: UIImageView!
    
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location
        restaurantImageView.image = UIImage(named: restaurant.image)
    }
    
}
