//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Muhammad Ashary on 24/07/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var reviewImageView: UIImageView!
    @IBOutlet var buttonClose: UIButton!
    
    var restaurant: RestaurantMO?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blureffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blureffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        if let restaurant = restaurant {
            reviewImageView.image = UIImage(data: restaurant.image as! Data)
        }
        
        buttonClose.transform = CGAffineTransform.init(translationX: 1000, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            
            self.buttonClose.transform = CGAffineTransform.identity
            
        }, completion: nil)
    }

}
