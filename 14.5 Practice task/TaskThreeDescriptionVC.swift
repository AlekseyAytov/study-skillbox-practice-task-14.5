//
//  TaskThreeDescriptionVC.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/27/23.
//

import UIKit

class TaskThreeDescriptionVC: UIViewController {
    
    var descriptionText: String!
    var locationText: String!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionText
        locationLabel.text = locationText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
