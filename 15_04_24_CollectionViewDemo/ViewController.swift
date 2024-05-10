//
//  ViewController.swift
//  15_04_24_CollectionViewDemo
//
//  Created by Vishal Jagtap on 10/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodItemCollectionView: UICollectionView!
    var foodItems : [String] = ["Pohe", "Upma", "Samosa", "Vada Pav"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
    }
    
    func initializeCollectionView(){
        foodItemCollectionView.dataSource = self
        foodItemCollectionView.delegate = self
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.foodItemCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as! FoodItemCollectionViewCell
        cell.foodItemNameLabel.text = foodItems[indexPath.item]
        return cell
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let collectionViewWidth = self.foodItemCollectionView.frame.width
        print(collectionViewWidth)
        let calculatedCellWidth = ((collectionViewWidth/2.0) - 40.0)
        print(calculatedCellWidth)
    
        return CGSize(width: calculatedCellWidth, height: calculatedCellWidth)
    }
}


extension ViewController : UICollectionViewDelegate{
    
}
