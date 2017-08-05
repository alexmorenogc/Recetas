//
//  RecipeCell.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 3/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
 
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
