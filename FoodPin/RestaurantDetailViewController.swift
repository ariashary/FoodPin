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
    
    var restaurantName = ""
    var restaurantType = ""
    var restaurantLocation = ""
    var restaurantImage = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantNameLabel.text = restaurantName
        restaurantTypeLabel.text = restaurantType
        restaurantLocationLabel.text = restaurantLocation
        restaurantImageView.image = UIImage(named: restaurantImage)
    }
    
}
