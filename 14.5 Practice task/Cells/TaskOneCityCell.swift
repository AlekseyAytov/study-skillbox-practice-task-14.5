//
//  TaskOneCityCell.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/17/23.
//

import UIKit

class TaskOneCityCell: UICollectionViewCell {

    @IBOutlet weak var cityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImage.contentMode = .scaleAspectFit
        

    }
    
    

}
