//
//  TaskOneCityVC.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/17/23.
//

import UIKit

class TaskOneCityVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var cityTitle: UILabel!
    
    // переменная, содержащая индекс видимого элемента collectionView
    var indexPathsForVisibleCell: IndexPath!
    
    // список городов выбранной страны
    var cityData: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.Colors.blue
        collectionView.backgroundColor = Constants.Colors.blue
 
        // 1. получение значение типа UINib, соответствующее xib-файлу кастомой ячейки
        let cellTypeNib = UINib(nibName: "TaskOneCityCell", bundle: nil)
        // 2. регистрация кастомной ячейки в табличном представлении
        self.collectionView!.register(cellTypeNib, forCellWithReuseIdentifier: "CityCell")
        
//        for constraint in collectionView.constraints {
//            if constraint.identifier == "heightCell" {
//                constraint.constant = cell.cityImage.bounds.height // .rounded()
//            }
//        }
        
        cityTitle.font = Constants.Fonts.u30Bold
        cityTitle.text = cityData[0].title
        
        // вместо переопределения flowLayout возможно использование методов UICollectionViewDelegateFlowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize.width = UIScreen.main.bounds.width - 10
        flowLayout.itemSize.height = collectionView.bounds.height
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10

        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // при появлении контроллера проинициализируем переменную с индесом видимого элемента collectionView
        if let iPath = collectionView?.indexPathsForVisibleItems.first {
            indexPathsForVisibleCell = iPath
            print("First inicialisation of indexPathsForVisibleCell")
        }
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

// MARK: UICollectionViewDataSource

extension TaskOneCityVC: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! TaskOneCityCell
        cell.cityImage.image = UIImage(named: cityData[indexPath.row].imageName)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension TaskOneCityVC: UICollectionViewDelegate {
    
    // When the cell has "snapped into place" it will trigger this method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // если видимый элемент(ячейка) поменялся, то меняется название города
        if let iPath = collectionView?.indexPathsForVisibleItems.first, iPath != indexPathsForVisibleCell {
            print("DidEndDecelerating - visible cell is: ", iPath)
            cityTitle.text = cityData[iPath.row].title
            indexPathsForVisibleCell = iPath
        }
    }
}
