//
//  ViewController.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 12/27/22.
//

import UIKit

class TaskOneVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    // данные по заданию
    var taskOneData: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskOneData = TaskOneData().loadData()
        tableView.separatorStyle = .none
        tableView.backgroundColor = Constants.Colors.blue
        view.backgroundColor = Constants.Colors.darkBlue
        
        // настройка tabbar
        setupTabBarAppearance()
        // настройка NavigationBar
        setupNavigationBar()
        
        // 1. получение значение типа UINib, соответствующее xib-файлу кастомой ячейки
        let cellTypeNib = UINib(nibName: "TaskOneCell", bundle: nil)
        // 2. регистрация кастомной ячейки в табличном представлении
        self.tableView.register(cellTypeNib, forCellReuseIdentifier: "Cell")
    }
    
    private func setupTabBarAppearance() {
          // настройка внешенего вида через UITabBarAppearance
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = Constants.Colors.darkBlue
//        self.tabBarController?.tabBar.standardAppearance = appearance
//        self.tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        tabBarController?.tabBar.tintColor = Constants.Colors.lightBlue
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.tabBar.shadowImage = UIImage()
        tabBarController?.tabBar.backgroundImage = UIImage()
        tabBarController?.tabBar.itemPositioning = .centered
        
        // добавление обводки вокруг иконок
        let shapeLayer = CAShapeLayer()
        // фиксированная ширина и высота
        let width = 300
        let height = 57
        // вычисление позиции по оси Х
        let positionX = (Int((tabBarController?.tabBar.bounds.width)!) - width) / 2
        // рисуем прямоугольник, используя класс UIBezierPath
        let path = UIBezierPath(
            roundedRect: CGRect(x: positionX, y: 0, width: width, height: height),
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 17, height: 0)
        )
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = Constants.Colors.blue.cgColor
        // добавлеяем shapeLayer в низ иерархии layer
        tabBarController?.tabBar.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func setupNavigationBar() {
        // делаем navigationBar прозрачным
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // делаем прозрачной тонкую полоску ниже navigationBar
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Constants.Fonts.u24Regular!]
        navigationController?.navigationBar.tintColor = Constants.Colors.lightBlue
        navigationItem.title = "Task 1"
        navigationItem.backButtonTitle = "To main"
    }
}

// MARK: UITableViewDataSource

extension TaskOneVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskOneData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskOneCell
        cell.countryImage.image = UIImage(named: taskOneData[indexPath.item].imageName)
        cell.countryName.text = taskOneData[indexPath.item].title
        cell.changeHeightConstarint()
        return cell
    }
}

// MARK: UITableViewDelegate

extension TaskOneVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
        let taskOneCityVC = storyboardInstance.instantiateViewController(withIdentifier: "taskOneCityVC") as! TaskOneCityVC
        taskOneCityVC.chosenCountry = taskOneData[indexPath.item].title
        taskOneCityVC.cityData = taskOneData[indexPath.item].cities
        self.navigationController?.pushViewController(taskOneCityVC, animated: true)
    }
}
