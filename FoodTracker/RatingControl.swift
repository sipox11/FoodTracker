//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Jose Carlos Montero Gómez on 28/10/2017.
//  Copyright © 2017 sipox11. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    // Collection of buttons that form the rating bar
    private var ratingButtons = [UIButton]()
    
    // This property will hold the value of the rating chosen by the user
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        // Make sure the index of the tapped button is not out of bounds
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        print("Button #\(index) pressed 👍")
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if(selectedRating == rating) {
            // If the selected star represents the current rating, reset the rating to 0
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
            
        }
        
        
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // Set up as many buttons as specified in the attributes inspector
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            // Set image resources for each button state
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
            
            // Update button selection states
            updateButtonSelectionStates()
        }
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            // If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }
}
