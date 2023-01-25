//
//  ListOrderViewController.swift
//  FoodOrderApp
//
//  Created by Emre ÖZKÖK on 12.01.2023.
//

import UIKit

class ListOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders:[Order] = [
        .init(id: "id", name: "Emre Ozkok", dish: .init(id: "id2", name: "Mantı", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 12)),
        .init(id: "id", name: "Yuksel Ozkok", dish: .init(id: "id2", name: "Fasulye", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 12)),
        .init(id: "id", name: "Sena Ozkok", dish: .init(id: "id2", name: "Köfte", description: "Good for health!", image: "https://picsum.photos/100/200", calories: 12)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        register()
    }
    
    private func register(){
        tableView.register(UINib(nibName: ListDishTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListDishTableViewCell.identifier)
    }
}

extension ListOrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDishTableViewCell.identifier, for: indexPath) as! ListDishTableViewCell
        cell.setup(order: orders[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DishDetailViewController") as! DishDetailViewController
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
