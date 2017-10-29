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
        // The name must not be empty
        if name.isEmpty {
            return nil
        }
        
        // The rating must be a positive value between 0 and 5 exclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
