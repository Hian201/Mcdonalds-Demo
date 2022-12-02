//
//  MenuTableViewCell.swift
//  Mcdonalds Demo
//
//  Created by So í-hian on 2022/11/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var comboLabel: UILabel!
    @IBOutlet weak var KcalLabel: UILabel!
    
    @IBOutlet weak var mealImage: UIImageView!
    
    let menuTableViewController = MenuTableViewController()
    
    func cellUpdate(_ model: MenuItem) {
        nameLabel.text = model.name
        comboLabel.text = model.combo
        //KcalLabel.text = String(format: "%2d Kcal", model.kcal)
        KcalLabel.text = model.kcal! + " Kcal"
        menuTableViewController.fetchImage(from: model.image![0].url) { image in
            if let image {
                DispatchQueue.main.async {
                    self.mealImage.image = image
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
