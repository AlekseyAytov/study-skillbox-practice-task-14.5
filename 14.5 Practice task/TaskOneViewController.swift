//
//  ViewController.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 12/27/22.
//

import UIKit

class TaskOneViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskOneData: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskOneData = TaskOneData().loadData()
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.Colors.blue
        self.view.backgroundColor = Constants.Colors.darkBlue
        
        setupTabBarAppearance()

        // 1. получение значение типа UINib, соответствующее xib-файлу кастомой ячейки
        let cellTypeNib = UINib(nibName: "TaskOneCell", bundle: nil)
        // 2. регистрация кастомной ячейки в табличном представлении
        self.tableView.register(cellTypeNib, forCellReuseIdentifier: "Cell")
        
        
    }
    
    // исключение смены цвета tabbar при скролле до самого низа
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        // настройка внешенего вида без прозрачности
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Constants.Colors.darkBlue
        
        self.tabBarController?.tabBar.standardAppearance = appearance
        self.tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        UITabBar.appearance().tintColor = Constants.Colors.lightBlue
    }


}

// MARK: UITableViewDataSource

extension TaskOneViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskOneData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskOneCell
        cell.countryImage.image = UIImage(named: taskOneData[indexPath.item].imageName)
        cell.countryName.text = taskOneData[indexPath.item].title
        cell.changeHeightConstarint()
        cell.backgroundColor = Constants.Colors.blue
        return cell
    }
}


extension TaskOneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
        let taskOneCityVC = storyboardInstance.instantiateViewController(withIdentifier: "taskOneCityVC") as! TaskOneCityVC
        taskOneCityVC.cityData = taskOneData[indexPath.item].cities
        self.navigationController?.pushViewController(taskOneCityVC, animated: true)
    }
}
