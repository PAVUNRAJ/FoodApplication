//
//  CategoryListCell.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 17/12/22.
//

import UIKit

class CategoryListCell: UICollectionViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String {
        return String(describing: self)
    }
    
    
    func setupUI(){
        bgView.setupUIview(background: .white, cornerRadius: 25.0, borderColor: .clear, borderWidth: 0)
        
    }
}
