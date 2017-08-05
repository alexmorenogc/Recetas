//
//  RecipeDetailViewCell.swift
//  Recetas
//
//  Created by Alexander Moreno Guillén on 5/8/17.
//  Copyright © 2017 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {
    
    
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
