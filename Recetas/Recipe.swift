//
//  Recipe.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 3/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isFavorite : Bool = false
    
    var rating : String = "rating"
    
    
    //Constructor
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
}
