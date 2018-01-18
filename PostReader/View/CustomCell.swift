//
//  CustomCell.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(post: Post) {
        
        self.titleLbl.text = post.title
        
    }
    
    
    

}
