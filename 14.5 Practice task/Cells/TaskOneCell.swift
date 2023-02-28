//
//  TableViewCell.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/15/23.
//

import UIKit

class TaskOneCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    var aspectR: CGFloat = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
        self.backgroundColor = Constants.Colors.blue
        
        countryImage.contentMode = .scaleAspectFit
        countryImage.layer.borderWidth = 1
        countryImage.layer.cornerRadius = 5
        countryImage.layer.borderColor = Constants.Colors.darkBlue.cgColor
        
        countryName.font = Constants.Fonts.u16Medium
    }
    
//    override func prepareForReuse() {
//        countryImage = nil
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    // динамическое выставление констрейта высоты countryImage для корректного автоопределения высоты ячейки
    func changeHeightConstarint() {
        guard let image = countryImage.image else { return }
        // определение соотношение сторон назначенного изображения
        aspectR = image.size.width / image.size.height
        // определение ширины bounds countryImage (назначено констрейтом в IB)
        let currentWidth = countryImage.bounds.width
        // расчет необходимой высоты
        let heightСonstant = (currentWidth/aspectR).rounded()
        NSLayoutConstraint(item: countryImage!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightСonstant).isActive = true
    }
}
