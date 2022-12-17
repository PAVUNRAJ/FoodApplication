//
//  ProductListCell.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 17/12/22.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productLbl: UILabel!
    @IBOutlet weak var productDecLbl: UILabel!
    @IBOutlet weak var productCategoryImg: UIImageView!
    @IBOutlet weak var productCostLbl: UILabel!
    @IBOutlet weak var countSubBtn: UIButton!
    @IBOutlet weak var countAddBtn: UIButton!
    @IBOutlet weak var addBtnView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var addBtn: UIButton!
    
    var addBtnClick : (() -> ())? = nil
    var subBtnClick : (() -> ())? = nil
    var addClick : (() -> ())? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    
    static var identifier : String {
        return String(describing: self)
    }
    
    
    func setupUI(){
        
        stackView.isHidden = true
        addBtn.isHidden = false
        
        bgView.setupUIview(background: .white, cornerRadius: 8, borderColor: .clear, borderWidth: 0)
        
        addBtnView.setupUIview(background: ColorPalette.viewColor, cornerRadius: addBtnView.frame.height / 2, borderColor:.clear, borderWidth: 0)
        addBtn.setButton(titleColor: .black, backgroundColor: ColorPalette.btnColor, cornerRadius: addBtn.frame.size.height/2, borderColor: .clear, borderWidth: 0, title: "Add", fontSize: UIFont.boldSystemFont(ofSize: 13))
    }
    
  
    
    @IBAction func AddBtn(_ sender: UIButton) {
        if let btnAction = self.addClick
        {
            btnAction()
        }
    }
    @IBAction func addBtnTapped(_ sender: UIButton){
        if let btnAction = self.addBtnClick
        {
            btnAction()
        }
    }
    
    @IBAction func subBtnTapped(_ sender: UIButton){
        if let btnAction = self.subBtnClick
        {
            btnAction()
        }
    }
    
    
}
