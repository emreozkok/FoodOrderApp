//
//  HomeViewController.swift
//  FoodOrderApp
//
//  Created by Emre ÖZKÖK on 11.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "African Food 1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Food 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Food 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Food 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "African Food 5", image: "https://picsum.photos/100/200"),]
    
    var midDishes:[Dish] = [
        .init(id: "id2", name: "African", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 12),
        .init(id: "id2", name: "Asian", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 300),
        .init(id: "id2", name: "Mexicon", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 120),
        .init(id: "id2", name: "Turkish", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 250),
        .init(id: "id2", name: "Italian", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 1000),]
    
    var specials: [Dish] = [
        .init(id: "id3", name: "Patlıcan", description: "Seeven sever", image: "https://picsum.photos/100/200", calories: 134),
        .init(id: "id3", name: "Pide", description: "Yerinde yemelisin yoksa olmaz aç kalırsn dasdas sdasdas adsadas asdasdas asdasdas asdasdas asdasdas asdasdasd ", image: "https://picsum.photos/100/200", calories: 234),
        .init(id: "id3", name: "Döner", description: "Seeven sever", image: "https://picsum.photos/100/200", calories: 500),
        .init(id: "id3", name: "Kebab", description: "Seeven sever", image: "https://picsum.photos/100/200", calories: 1200),
        .init(id: "id3", name: "Mantı", description: "Seeven sever", image: "https://picsum.photos/100/200", calories: 2398),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("runned")
        title = "FOOD ORDER"
        registerCell()
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        dishCollectionView.register(UINib(nibName: DishPotraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPotraitCollectionViewCell.identifier)
        chefSpecialCollectionView.register(UINib(nibName: ChefSpeacialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpeacialCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case dishCollectionView:
            return midDishes.count
        case chefSpecialCollectionView:
            return specials.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            
            return cell
        case dishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPotraitCollectionViewCell.identifier, for: indexPath) as! DishPotraitCollectionViewCell
            cell.setup(dish: midDishes[indexPath.row])
            
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpeacialCollectionViewCell.identifier, for: indexPath) as! ChefSpeacialCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ListDishViewController") as! ListDishViewController
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "DishDetailViewController") as! DishDetailViewController
            controller.dish = collectionView == dishCollectionView ? midDishes[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
