//
//  TaskTwoTableVC.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/21/23.
//

import UIKit

class TaskTwoTableVC: UITableViewController {
    
    var taskTwoData: [String: [NewsRecords]]! {
        didSet {
            // сортировка списка статей по дате
            for (key, newsRecords) in taskTwoData {
                taskTwoData[key] = newsRecords.sorted {
                    $0.publishedAt < $1.publishedAt
                }
            }
        }
    }
    
    // форматтер для вывода даты в ячейках
    var formatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = Constants.DateFormat.forCell
        return formatter
    }()
    // данные для секций, ключи словаря taskTwoData
    var sectionsData: [String]! {
        didSet {
            sectionsData.sort {
                // сортировка строк
                $0.toDate(.custom(Constants.DateFormat.forSection))! < $1.toDate(.custom(Constants.DateFormat.forSection))!
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTwoData = TaskTwoData().loadData()
        sectionsData = Array(taskTwoData.keys)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionsData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionDate = sectionsData[section]
        return taskTwoData[sectionDate]?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsRecordCell", for: indexPath)
        let sectionDate = sectionsData[indexPath.section]
        if let titleLabel = cell.viewWithTag(1) as? UILabel {
            titleLabel.text = taskTwoData[sectionDate]![indexPath.row].title
        }
        if let dateLabel = cell.viewWithTag(2) as? UILabel {
            dateLabel.text = formatter.string(from: taskTwoData[sectionDate]![indexPath.row].publishedAt)
        }

        cell.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "SECTION TITLE: \(sectionsData[section])"
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
