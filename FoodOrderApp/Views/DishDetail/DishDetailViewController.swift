//
//  DishDetailViewController.swift
//  FoodOrderApp
//
//  Created by Emre ÖZKÖK on 11.01.2023.
//

import UIKit
import Kingfisher

class DishDetailViewController: UIViewController {

    @IBOutlet weak var imageDet: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var calLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeData()
      
    }
    
    private func placeData(){
        imageDet.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        calLbl.text = dish.formattedCal
        descriptionLbl.text = dish.description
    }

    @IBAction func orderBtnClicked(_ sender: UIButton) {
    }
    
}
