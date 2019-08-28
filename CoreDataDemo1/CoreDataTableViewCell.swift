//
//  CoreDataTableViewCell.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 28/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        return "CoreDataTableViewCell"
    }
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureViews(title: String, subTitle: String) {
        titlelabel.text = title
        subTitleLabel.text = subTitle
    }
    
}
