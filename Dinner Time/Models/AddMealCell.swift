//
//  AddMealCell.swift
//  Dinner Time
//
//  Created by Ben Gauger on 2/22/23.
//

import UIKit

class AddMealCell: UITableViewCell {
    
    
    @IBOutlet weak var dislikebutton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var familyMemberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        dislikebutton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        dislikebutton.layer.borderWidth = 0.5
        likeButton.layer.borderColor = UIColor(ciColor: .gray).cgColor
        likeButton.layer.borderWidth = 0.5
    }


}
