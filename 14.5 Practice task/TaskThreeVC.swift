//
//  ViewController.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 12/27/22.
//

import UIKit

class TaskThreeVC: UIViewController {
    var taskThreeData: [NewsWithLocationModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskThreeData = TaskThreeData().loadData()
    }
}

// MARK: - Table view data source

extension TaskThreeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskThreeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            cell = reuseCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        }
            
        configureCell(cell: &cell, for: indexPath)
        return cell
        }
            
    private func configureCell(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = taskThreeData[indexPath.row].name
        cell.contentConfiguration = configuration
    }
}

// MARK: - Table view delegate

extension TaskThreeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "descriptionVC") as! TaskThreeDescriptionVC
        nextViewController.descriptionText = taskThreeData[indexPath.row].description
        nextViewController.locationText = taskThreeData[indexPath.row].location
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
