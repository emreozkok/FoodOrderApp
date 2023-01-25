//
//  ListDishViewController.swift
//  FoodOrderApp
//
//  Created by Emre ÖZKÖK on 11.01.2023.
//

import UIKit

class ListDishViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory?
    
    var midDishes:[Dish] = [
        .init(id: "id2", name: "African", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 12),
        .init(id: "id2", name: "Asian", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 300),
        .init(id: "id2", name: "Mexicon", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 120),
        .init(id: "id2", name: "Turkish", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 250),
        .init(id: "id2", name: "Italian", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 1000),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name
        register()
     
    }
    
    private func register(){
        tableView.register(UINib(nibName: ListDishTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListDishTableViewCell.identifier)
    }


}

extension ListDishViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return midDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDishTableViewCell.identifier, for: indexPath) as! ListDishTableViewCell
        cell.setup(dish: midDishes[indexPath.row])
        return cell
    }
    
    
}
