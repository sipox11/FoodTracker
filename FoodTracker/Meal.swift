//
//  Meal.swift
//  FoodTracker
//
//  Created by Jose Carlos Montero Gómez on 29/10/2017.
//  Copyright © 2017 sipox11. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization should fail if there is no name of ir the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
