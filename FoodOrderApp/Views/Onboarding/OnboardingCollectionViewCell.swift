//
//  OnboardingCollectionViewCell.swift
//  FoodOrderApp
//
//  Created by Emre ÖZKÖK on 10.01.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var slideTitle: UILabel!
    
    @IBOutlet weak var slideDescription: UILabel!
    
    func setup(_ slide: OnboardingSlide){
        slideImage.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
}
